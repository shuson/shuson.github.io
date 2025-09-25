---
layout: post
title: Benchmark GPU by perf analyzer of triton inference server
tags:
    - GPU
    - AI
    - H100
    - perf
    - triton
    - Infra
---

To fastly benchmark the performance of a GPU card, we can use [perf analyzer](https://github.com/triton-inference-server/perf_analyzer) of triton inference server.

## TLDR;

Steps in short:

1. Install Docker on Ubuntu OS with GPU support
2. Run Triton inference server in docker container
3. Run perf analyzer to benchmark a GPU in docker container

## Install Docker on Ubuntu OS with GPU support

1. install driver and cuda

```
sudo apt update
sudo apt install -y build-essential dkms

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
```
visit https://developer.nvidia.com/cuda-toolkit-archive and download the cuda toolkit for ubuntu 24.04, choose runfile local installation
reboot system after installation, and check the cuda version by `nvidia-smi`

2. install docker
```
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Enable and test Docker
sudo systemctl enable docker --now
docker run hello-world
```

3. install nvidia-container-toolkit
```
# Add NVIDIA container runtime repo
curl -s -L https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /etc/apt/keyrings/nvidia-container-toolkit.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
  | sed 's#deb https://#deb [signed-by=/etc/apt/keyrings/nvidia-container-toolkit.gpg] https://#g' \
  | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# Install toolkit
sudo apt update
sudo apt install -y nvidia-container-toolkit

# Configure runtime
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

Then test docker is running with GPU supported by 
```docker run --rm --runtime=nvidia --gpus all nvidia/cuda:12.4.99-base-ubuntu22.04 nvidia-smi```

## Run Triton inference server in docker container
Prepare a model repository, for example, `models` folder in current directory
We can use example models from `git clone --depth 1 https://github.com/triton-inference-server/server`
and `cp -r server/examples/models/simple models/`

```
# Pull Triton (latest, optimized for CUDA 12)
docker pull nvcr.io/nvidia/tritonserver:24.09-py3

# Run Triton with GPU access
docker run --gpus all --rm -p8000:8000 -p8001:8001 -p8002:8002 \
  -v $PWD/models:/models nvcr.io/nvidia/tritonserver:24.09-py3 \
  tritonserver --model-repository=/models
```

### Run perf analyzer to benchmark a GPU in docker container

```
sudo docker run --gpus all --rm -it --net host nvcr.io/nvidia/tritonserver:24.09-py3-sdk
```

In the container, run perf analyzer
```
perf_analyzer -m simple
```

Result example:
```
*** Measurement Settings ***
  Batch size: 1
  Service Kind: TRITON
  Using "time_windows" mode for stabilization
  Stabilizing using average latency and throughput
  Measurement window: 5000 msec
  Using synchronous calls for inference

Request concurrency: 1
  Client: 
    Request count: 109574
    Throughput: 6005.78 infer/sec
    Avg latency: 164 usec (standard deviation 61 usec)
    p50 latency: 162 usec
    p90 latency: 172 usec
    p95 latency: 175 usec
    p99 latency: 186 usec
    Avg HTTP time: 161 usec (send/recv 18 usec + response wait 143 usec)
  Server: 
    Inference count: 109574
    Execution count: 109574
    Successful request count: 109574
    Avg request latency: 62 usec (overhead 8 usec + queue 11 usec + compute input 8 usec + compute infer 32 usec + compute output 2 usec)

Inferences/Second vs. Client Average Batch Latency
Concurrency: 1, throughput: 6005.78 infer/sec, latency 164 usec
```