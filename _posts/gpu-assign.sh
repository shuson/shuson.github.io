#!/usr/bin/env bash
# gpu-assign.sh — Assign specific NVIDIA GPUs to a Unix user using systemd + cgroups v2
# Usage:
#   sudo ./gpu-assign.sh apply   -u <username> -g <gpu_list> [--set-env] [--name <label>]
#   sudo ./gpu-assign.sh remove  -u <username> [--name <label>]
#   sudo ./gpu-assign.sh verify  -u <username> [--name <label>]
#
# Examples:
#   sudo ./gpu-assign.sh apply  -u alice -g 0,1 --set-env
#   sudo ./gpu-assign.sh verify -u alice
#   sudo ./gpu-assign.sh remove -u alice
#
# Notes:
# - Requires systemd (cgroups v2). Run as root (sudo).
# - Applies to **all** processes in the user’s systemd user instance.
# - --set-env appends CUDA vars to the user's ~/.bashrc (quality-of-life, not enforcement).

set -euo pipefail

die() { echo "ERROR: $*" >&2; exit 1; }
info() { echo "[*] $*"; }
ok()   { echo "[✓] $*"; }
warn() { echo "[!] $*"; }

require_root() {
  if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
    die "Please run as root (use sudo)."
  fi
}

check_cgroup_v2() {
  if [[ ! -f /sys/fs/cgroup/cgroup.controllers ]]; then
    die "Cgroups v2 not detected at /sys/fs/cgroup/cgroup.controllers. This script targets systemd + cgroup v2."
  fi
}

USER_NAME=""
GPU_LIST=""
SET_ENV="0"
DROPIN_NAME="10-nvidia-gpu.conf"

COMMAND="${1:-}"
shift || true

# Simple arg parser
while [[ $# -gt 0 ]]; do
  case "$1" in
    -u|--user) USER_NAME="${2:-}"; shift 2 ;;
    -g|--gpus) GPU_LIST="${2:-}"; shift 2 ;;
    --set-env) SET_ENV="1"; shift ;;
    --name)    DROPIN_NAME="${2:-}"; shift 2 ;;
    -h|--help)
      sed -n '1,60p' "$0"
      exit 0
      ;;
    *)
      # ignore unknown to allow subcommands first
      shift
      ;;
  esac
done

require_root
check_cgroup_v2

[[ -n "$USER_NAME" ]] || die "Missing -u|--user <username>."
id "$USER_NAME" >/dev/null 2>&1 || die "User '$USER_NAME' not found."
USER_UID="$(id -u "$USER_NAME")"
DROPIN_DIR="/etc/systemd/system/user@${USER_UID}.service.d"
DROPIN_FILE="${DROPIN_DIR}/${DROPIN_NAME}"

ensure_nvidia_devices_present() {
  if ! command -v nvidia-smi >/dev/null 2>&1; then
    warn "nvidia-smi not found in PATH. Continuing, but driver may not be installed."
  fi
  if [[ ! -e /dev/nvidiactl ]]; then
    warn "/dev/nvidiactl not found; NVIDIA driver may not be loaded yet."
  fi
}

restart_user_instance() {
  systemctl daemon-reload
  # Restart the user's systemd user instance; may be inactive if the user hasn't logged in.
  if systemctl status "user@${USER_UID}.service" >/dev/null 2>&1; then
    info "Restarting user@${USER_UID}.service…"
    systemctl restart "user@${USER_UID}.service" || true
  else
    warn "user@${USER_UID}.service not active. The policy will apply when the user next logs in or when the service starts."
  fi
}

apply_policy() {
  [[ -n "$GPU_LIST" ]] || die "Missing -g|--gpus <comma_separated_indices> (e.g., 0,1)."
  ensure_nvidia_devices_present

  IFS=',' read -r -a GPUS <<< "$GPU_LIST"
  for g in "${GPUS[@]}"; do
    [[ "$g" =~ ^[0-7]$|^[0-9]+$ ]] || die "GPU index '$g' is not an integer."
    if [[ ! -e "/dev/nvidia$g" ]]; then
      warn "/dev/nvidia$g does not exist right now. Continuing (device nodes appear when driver is loaded)."
    fi
  done

  info "Creating drop-in at ${DROPIN_FILE}"
  install -d -m 0755 "$DROPIN_DIR"
  {
    echo "[Service]"
    echo "DevicePolicy=closed"
    # Core NVIDIA control devices
    echo "DeviceAllow=/dev/nvidiactl rwm"
    echo "DeviceAllow=/dev/nvidia-uvm rwm"
    echo "DeviceAllow=/dev/nvidia-uvm-tools rwm"
    echo "DeviceAllow=/dev/nvidia-caps/* rwm"
    # Allow only the requested GPU character devices
    for g in "${GPUS[@]}"; do
      echo "DeviceAllow=/dev/nvidia${g} rwm"
    done
  } > "$DROPIN_FILE"

  ok "Wrote policy:"
  sed 's/^/    /' "$DROPIN_FILE"

  restart_user_instance

  if [[ "$SET_ENV" == "1" ]]; then
    info "Appending CUDA environment to ${USER_NAME}'s ~/.bashrc"
    sudo -u "$USER_NAME" bash -lc "grep -q 'CUDA_DEVICE_ORDER=PCI_BUS_ID' ~/.bashrc || echo 'export CUDA_DEVICE_ORDER=PCI_BUS_ID' >> ~/.bashrc"
    sudo -u "$USER_NAME" bash -lc "grep -q 'CUDA_VISIBLE_DEVICES=' ~/.bashrc && sed -i 's/^export CUDA_VISIBLE_DEVICES=.*/export CUDA_VISIBLE_DEVICES=${GPU_LIST}/' ~/.bashrc || echo 'export CUDA_VISIBLE_DEVICES=${GPU_LIST}' >> ~/.bashrc"
    ok "Added/updated CUDA vars for convenience (not enforcement)."
  fi

  ok "Applied cgroup device policy for user '${USER_NAME}' (UID ${USER_UID}) to GPUs: ${GPU_LIST}"
  echo "NOTE: If the user is currently logged in, they may need to log out and log back in for all sessions to inherit the policy."
}

remove_policy() {
  if [[ -f "$DROPIN_FILE" ]]; then
    info "Removing ${DROPIN_FILE}"
    rm -f "$DROPIN_FILE"
    restart_user_instance
    ok "Removed GPU device policy for user '${USER_NAME}'."
  else
    warn "No drop-in file found at ${DROPIN_FILE}; nothing to remove."
  fi
}

verify_policy() {
  echo "User: ${USER_NAME} (UID ${USER_UID})"
  if [[ -f "$DROPIN_FILE" ]]; then
    ok "Drop-in exists at ${DROPIN_FILE}:"
    sed 's/^/    /' "$DROPIN_FILE"
  else
    warn "Drop-in does NOT exist at ${DROPIN_FILE}."
  fi

  echo
  info "Testing as ${USER_NAME}: listing visible GPUs via nvidia-smi (if available)…"
  if command -v sudo >/dev/null 2>&1; then
    if command -v nvidia-smi >/dev/null 2>&1; then
      sudo -iu "$USER_NAME" bash -lc 'nvidia-smi || true'
    else
      warn "nvidia-smi not installed; skipping."
    fi
  else
    warn "sudo not available to switch user; skipping runtime check."
  fi

  echo
  info "Reminder: Enforcement is at the device node level. Tools may still *list* all GPUs unless blocked by device access."
}

case "$COMMAND" in
  apply)  apply_policy ;;
  remove) remove_policy ;;
  verify) verify_policy ;;
  *)
    echo "Usage:"
    echo "  sudo $0 apply  -u <username> -g <gpu_list> [--set-env] [--name <dropin_filename.conf>]"
    echo "  sudo $0 remove -u <username> [--name <dropin_filename.conf>]"
    echo "  sudo $0 verify -u <username> [--name <dropin_filename.conf>]"
    exit 2
    ;;
esac
