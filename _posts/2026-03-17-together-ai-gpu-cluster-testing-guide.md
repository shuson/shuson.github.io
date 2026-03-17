---
layout: post
title: "A Practitioner's Guide to Testing Large GPU Clusters"
date: 2026-03-17
categories: [AI, Infrastructure, GPU]
tags: [gpu-cluster, testing, acceptance-testing, h100, infiniband, nccl, together-ai, infrastructure]
---

## 🔥 Testing Large GPU Clusters for AI Training

Training generative AI models requires clusters of expensive cutting-edge hardware: H100 GPUs, fast storage, InfiniBand links, switches, and transceivers. But not all clusters are created equal. Due to hardware complexity, clusters often contain misassembled, misconfigured, or dead-on-arrival (DoA) components.

Together AI has developed a robust **acceptance testing framework** implemented across clusters containing thousands of GPUs. Here's a distilled guide to their hierarchical testing process.

### Why Acceptance Testing Matters

Even industry giants face hardware challenges. Meta reported that during Llama 3.1's 54-day training run, **GPU issues accounted for 58.7% of all unexpected issues**. Acceptance testing helps:

- Catch misconfigured or DoA components before deployment
- Ensure reliability for demanding AI/ML workloads
- Optimize operational efficiency
- Maintain customer trust

---

## The 7-Step Testing Process

### 1️⃣ Preparation and Configuration

Set up the cluster to mimic end-use scenarios:

```bash
# Install core dependencies
- NVIDIA drivers
- OFED drivers (for InfiniBand)
- CUDA
- NCCL
- HPCX
- Configure SLURM cluster
- Configure PCI settings for performance
```

Once dependencies are installed, begin validating every subsystem individually, culminating in a reference task tailored to your use case.

### 2️⃣ GPU Validation

Start by verifying GPU type and count match expectations:

```bash
# Check GPU count (should return 8 for 8x H100 machine)
$ nvidia-smi | grep H100 | wc -l
8
```

**Stress Testing with DCGM:**

```bash
# Pull DCGM container
$ apptainer pull docker://nvidia/dcgm:3.3.6-1-ubuntu22.04

# Run diagnostics
$ apptainer exec --nv dcgm_3.3.6-1-ubuntu22.04.sif /usr/bin/dcgmi diag --run 3 --fail-early
```

DCGM tests power consumption, temperature, PCIe, GPU memory, and more under load.

**Long-Running Stress with gpu-burn:**

```bash
$ apptainer pull docker://oguzpastirmaci/gpu-burn:latest
$ apptainer exec --nv gpu-burn_latest.sif /app/gpu_burn 60
```

This ensures GPUs handle consistent heavy load without memory errors.

### 3️⃣ NVLink and NVSwitch Validation

Verify GPUs can communicate at full bandwidth within a single machine:

**NCCL Tests** — Test GPU-to-GPU communication over NVLink. For large message sizes, expect to approach NVLink's unidirectional performance.

**nvbandwidth** — Measures GPU-to-GPU memcpy performance:

```bash
# Build from source: https://github.com/NVIDIA/nvbandwidth
# Run with default arguments

Running device_to_device_memcpy_write_ce.
memcpy CE GPU(row) <- GPU(column) bandwidth (GB/s)
 0 1 2 3 4 5 6 7
0 N/A 389.04 388.19 389.04 388.90 388.33 388.90 388.61
1 389.04 N/A 388.90 388.33 388.76 389.04 388.19 388.90
...
```

Expected: ~389 GB/s between GPUs on H100 systems.

### 4️⃣ Network Validation

Test InfiniBand or RoCE fabrics for distributed training:

**Basic Fabric Tests:**
```bash
ibping, ib_read_bw, ib_write_bw  # Test latency and throughput
```

**GPUDirect RDMA with NCCL:**
Run multi-node NCCL tests, scaling from 2 nodes to the entire cluster. Target: **~92% of theoretical fabric maximum** (e.g., ~370 GB/s on a 400 GB/s fabric).

**Sample SLURM Script for NCCL Tests:**
```bash
#!/bin/bash
#SBATCH --job-name=nccl-tests
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:8
#SBATCH --time=0:05:00

export NCCL_DEBUG=INFO
export NCCL_ALGO=RING
export NCCL_IB_PCI_RELAXED_ORDERING=1
export NCCL_IB_QPS_PER_CONNECTION=2

mpirun \
 --bind-to none \
 -mca btl tcp,self \
 -mca coll_hcoll_enable 0 \
 ${NCCL_TESTS_HOME}/build/all_reduce_perf -b 3G -e 24G -f 2 -g 8
```

**Ethernet Validation:** Use `iperf3` for standard network testing.

### 5️⃣ Storage Validation

Measure storage performance with `fio`:

```bash
# Example: Sequential read bandwidth test
$ fio fio-read-bw.job

READ: bw=21.8GiB/s (23.4GB/s), io=654GiB, run=30002msec
```

Test various scenarios:
- Random reads/writes
- Sustained reads/writes
- Various block sizes

### 6️⃣ Model Build (Reference Task)

Run a real-world workload to validate end-to-end performance:

**Popular Reference:** Train a Llama-3 8B architecture on 16 nodes using PyTorch FSDP.

**Monitor During Training:**
- Training throughput (tokens/second)
- Model Flops Utilization (MFU)
- GPU utilization
- Network communication latencies (all-reduce, etc.)

This verifies the cluster achieves reasonable MFU and communication efficiency for 1-10B parameter models.

### 7️⃣ Observability (Continuous Monitoring)

Acceptance testing is just the first step. Continuous monitoring is essential:

**Telegraf** — Lightweight agent for collecting system metrics:

- **Host-level:** CPU/GPU count, usage %, available memory/disk, network connectivity
- **Cluster-level:** Dashboards for cluster-wide health

**Key Metrics to Monitor:**
- GPU temperature and power draw (hot GPUs become stragglers)
- DNS lookup errors (affects dataset downloads, W&B logging)
- GPU "fell off the bus" events

**Example Telegraf DNS Query Config:**
```toml
[[inputs.dns_query]]
 servers = ["127.0.0.53"]
 domains = ["wandb.com", "r2.dev"]
 record_type = "A"
 timeout = "2s"
```

---

## Key Takeaways

| Phase | Focus | Tools |
|-------|-------|-------|
| 1. Preparation | Environment setup | NVIDIA drivers, CUDA, NCCL, SLURM |
| 2. GPU Validation | Individual GPU health | DCGM, gpu-burn |
| 3. NVLink | Intra-node communication | NCCL tests, nvbandwidth |
| 4. Network | Inter-node fabric | NCCL multi-node, ib_*, iperf3 |
| 5. Storage | I/O performance | fio |
| 6. Model Build | Real-world workload | PyTorch FSDP, Llama-3 8B |
| 7. Observability | Continuous monitoring | Telegraf, custom dashboards |

---

## Why This Matters

As AI models grow larger, **hardware reliability becomes the bottleneck**. A systematic acceptance testing process:

1. **Catches issues early** — Before they block weeks of training
2. **Provides baseline metrics** — Know what "good" looks like
3. **Enables rapid debugging** — Hierarchical testing pinpoints faults
4. **Builds operational confidence** — Trust your infrastructure

Together AI's framework has been validated across thousands of GPUs. Whether you're running a private cluster or evaluating cloud providers, these practices help ensure your hardware lottery wins.

---

**Source:** [Together AI Blog](https://www.together.ai/blog/a-practitioners-guide-to-testing-and-running-large-gpu-clusters-for-training-generative-ai-models)

_The hardware lottery is real. Acceptance testing is how you stack the odds in your favor._
