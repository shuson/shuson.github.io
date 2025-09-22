---
layout: post
title: Simple Benchmark for Inference by Tokps and Train by TFlops
tags:
    - GPU
    - AI
    - H100
    - ollama
    - Infra
---

To fastly benchmark the performance of a model, we can use [ollama](https://ollama.ai/) to run the model on the GPU. And Use torch to do train TFlops check

## TLDR;

Ways in short:

1. Ollama to run the model on single GPU with Q8
2. Use torch to do train TFlops check


## Inference Benchmark
Use ollama to run the model on single GPU with Q8
```bash
curl -fsSL https://ollama.com/install.sh | sh
```
reboot after install
Run deepseek model with Q8
```bash
ollama run --verbose deepseek-r1:14b-qwen-distill-q8_0 "generate 7 days trip plan in Singapore"
```
For L40S it will show something like this
```
total duration:       33.286239222s
load duration:        3.52636855s
prompt eval count:    11 token(s)
prompt eval duration: 2.599748914s
prompt eval rate:     4.23 tokens/s
eval count:           1099 token(s)
eval duration:        27.159271675s
eval rate:            40.47 tokens/s
```

## Train Benchmark
Install torch
```bash
pip install torch torchvision torchaudio
```

Run the code below to check the train TFlops

[python script](./gpu-benchmark.py)

You will see something like this
```
=== Results (median of reps) ===
Sparse CSR SpMM  (fp16): 0.0102 s | Delivered:     3.38 TFLOPS | nnz=8388608 (~50.00% dense-equiv)
Dense GEMM       (fp16):       0.0003 s | Delivered:   251.98 TFLOPS
```
