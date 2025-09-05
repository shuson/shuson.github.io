---
layout: post
title: Ways to isolate GPU cards in Ubuntu
tags:
    - GPU
    - AI
    - H100
    - k8s
    - Infra
---

To make sure OS user is assigned specific GPU or GPUs, which makes sure isolation of GPU resources, there are couple ways to do it.

## TLDR;

Ways in short:

1. Quick User-Specific GPU Assignment (via CUDA_VISIBLE_DEVICES in system environment)
2. System-Level Enforcement with Cgroups + systemd
3. Best practice in a bigger cluster, slurm or k8s resource scheduler

## Quick User-Specific GPU Assignment
Given there are 0-7 GPUs by index, here is the simplest method if you just want a user to see only GPU 0 or 1:
Edit the user’s shell configuration (e.g., ~/.bashrc or ~/.bash_profile) and add the following line:
```bash
export CUDA_VISIBLE_DEVICES=0,1,6
```
⚠️ Note: This only hides GPUs from CUDA applications. If another user also sets CUDA_VISIBLE_DEVICES, there’s no hard isolation—you’ll need system-level enforcement if strict exclusivity is required.

## Whole-GPU exclusivity with systemd + cgroups
For stricter guarantees, you can enforce GPU exclusivity at the system level, self-contained Bash script that sets up (or removes) systemd+cgroup v2 device isolation so one user can access only the GPUs you specify (e.g., 0,1). It writes a user@<UID>.service drop-in with DevicePolicy=closed and DeviceAllow=/dev/nvidiaX for the selected GPUs, plus the NVIDIA control devices. It also has a verify command and an optional flag to add CUDA_VISIBLE_DEVICES to the user’s shell.

[shell script](./gpu-assign.sh)

### How to use
1. Assign GPUs 0 and 1 to user alice and set CUDA env for convenience:
```bash
sudo ./gpu-assign.sh apply -u alice -g 0,1 --set-env
```
2. Check the applied policy and what nvidia-smi shows for alice:
```bash
sudo ./gpu-assign.sh verify -u alice
```
3. Remove the restriction for alice:
```bash
sudo ./gpu-assign.sh remove -u alice
```

## Slurm/K8s is a long story
TBD

