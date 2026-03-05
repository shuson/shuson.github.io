---
layout: post
title: "NVIDIA NVFP4 KV Cache - 4-Bit Quantization for 2x Context Length"
date: 2026-03-06
categories: [AI, Infrastructure, GPU]
tags: [nvidia, tensorrt-llm, quantization, kv-cache, blackwell, inference-optimization]
---

## 🚀 NVFP4 KV Cache

NVIDIA just announced **NVFP4 KV Cache**, a new 4-bit quantization format for Key-Value cache in LLM inference, designed specifically for **Blackwell GPUs**. The headline numbers are impressive:

| Metric | Improvement |
|--------|-------------|
| **Memory Footprint** | ↓ 50% vs FP8 KV cache |
| **Context Budget** | ↑ 2x larger sequences |
| **Cache Hit Rate** | ↑ ~20% higher |
| **TTFT Latency** | ↓ Up to 3x faster |
| **Accuracy Loss** | <1% vs BF16/FP8 baselines |

For anyone running LLM inference at scale, this is a significant efficiency gain.

### What is KV Cache?

LLMs generate tokens autoregressively—one by one, based on all previous tokens. Without KV cache, the model would recompute key and value tensors for every preceding token on each new generation step, wasting massive computation.

**KV cache solves this** by storing K/V tensors once and fetching them during attention, trading memory bandwidth for compute savings. The catch: the cache sits behind a fixed memory pool. When it fills, older context gets evicted. Future requests referencing evicted spans trigger cache misses and forced recomputation.

**NVFP4's value proposition**: By compressing KV cache from FP8 (8-bit) to 4-bit, you double the context budget without adding HBM. More context stays resident → higher cache hit rates → less recomputation.

### How NVFP4 Works

The quantization flow during inference:

1. **Prefill Phase**: Input sequence processed, K/V tensors computed and stored as NVFP4
2. **Decode Phase**: 
   - NVFP4 KV cache → dequantized to FP8 → attention computation
   - New token's K/V → quantized to NVFP4 → appended to cache

The dequantization overhead is minimal compared to the memory bandwidth savings during decode (which involves many KV cache read/writes).

### Accuracy Benchmarks

NVIDIA tested on **Qwen3-480B-A35B** across modern LLM benchmarks:

| Benchmark | NVFP4 vs FP16 |
|-----------|---------------|
| **LiveCodeBench** | Near parity (critical for code gen) |
| **MMLU-PRO** | <1% degradation |
| **MBPP** | <1% degradation |
| **Ruler 64K** | Robust at 64K context |

Key insight: **LiveCodeBench parity** means NVFP4 preserves precise multi-step code generation where small numerical errors could cause syntax or logic failures. **Ruler 64K** performance shows quantization noise doesn't accumulate destructively over long sequences.

### NVFP4 vs MXFP4

Not all 4-bit formats are equal. On **Llama 3.3 70B**, NVFP4 achieves **5% higher MMLU accuracy** than MXFP4. The advantage comes from:

- More granular block scaling
- Higher precision E4M3 FP8 scaling factors
- Lower quantization error during dequantization

### TensorRT-LLM Configuration

Here's how to enable NVFP4 KV cache in your inference stack:

#### Method 1: Model Optimizer (PTQ)

```python
from modelopt.torch.quantization import quantize, FP8_DEFAULT_CFG, NVFP4_KV_CFG

# Configure FP8 weights/activations + NVFP4 KV cache
quant_cfg = FP8_DEFAULT_CFG.copy()
quant_cfg["quant_cfg"].update(NVFP4_KV_CFG["quant_cfg"])

def forward_loop(model):
    for data in calibration_dataset:
        model(data)

model = quantize(model, quant_cfg, forward_loop)
```

#### Method 2: trtllm-build CLI

```bash
trtllm-build \
    --checkpoint_dir ./model_checkpoint \
    --output_dir ./nvfp4_engine \
    --max_batch_size 32 \
    --max_input_len 32768 \
    --max_seq_len 65536 \
    --kv_cache_dtype nvfp4 \
    --weights_dtype fp8 \
    --enable_kv_cache_quantization \
    --paged_kv_cache \
    --use_inflight_batching
```

#### Method 3: Python Build Config

```python
from tensorrt_llm import LLM, BuildConfig

build_config = BuildConfig(
    max_batch_size=32,
    max_input_len=32768,
    max_seq_len=65536,
    max_num_tokens=1048576,
    
    # KV Cache Quantization
    kv_cache_dtype="nvfp4",
    weights_dtype="fp8",
    quantization="fp8",
    enable_kv_cache_quantization=True,
    
    # Blackwell-specific
    architecture="sm100",  # Blackwell GPU
    paged_kv_cache=True,
    use_inflight_batching=True,
)

llm = LLM(model="Qwen/Qwen3-480B-A35B", build_config=build_config)
llm.build()
```

### Key Configuration Parameters

| Parameter | Value | Purpose |
|-----------|-------|---------|
| `kv_cache_dtype` | `"nvfp4"` | 4-bit KV cache quantization |
| `weights_dtype` | `"fp8"` | FP8 weight quantization |
| `architecture` | `"sm100"` | Blackwell GPU (SM100) |
| `max_seq_len` | `65536+` | Leverage 2x context budget |
| `max_batch_size` | `32-64` | Increased batch capacity |
| `paged_kv_cache` | `True` | Efficient memory management |

### Who Should Use This?

**✅ Ideal for:**
- Long-context reasoning (32K-128K tokens)
- High-concurrency serving (large batch sizes)
- Code generation workloads
- Multi-turn conversations with context reuse
- Blackwell GPU deployments (B200, GB200)

**⚠️ Stick with FP8 KV if:**
- Running on pre-Blackwell GPUs (H100, A100)
- Maximum accuracy is critical (<0.5% tolerance)
- Short context lengths (<8K tokens)

### Why It Matters

NVFP4 is part of NVIDIA's broader **software-hardware co-design** strategy for inference. Combined with:

- **NVIDIA Dynamo** for KV-aware routing and offload
- **TensorRT-LLM Wide-EP** for large MoE deployments
- **NVLink fabric** for multi-GPU scale-up

...it becomes feasible to serve larger models, longer sequences, and higher concurrency without sacrificing accuracy.

For teams hitting memory walls on long-context workloads, NVFP4 effectively doubles your context budget without hardware upgrades.

### Resources

- [NVIDIA Blog Post](https://developer.nvidia.com/blog/optimizing-inference-for-long-context-and-large-batch-sizes-with-nvfp4-kv-cache/)
- [TensorRT Model Optimizer](https://github.com/NVIDIA/TensorRT-Model-Optimizer)
- [NVFP4 Introduction](https://developer.nvidia.com/blog/introducing-nvfp4-for-efficient-and-accurate-low-precision-inference/)
- [TensorRT-LLM Wide-EP](https://developer.nvidia.com/blog/scaling-large-moe-models-with-wide-expert-parallelism-on-nvl72-rack-scale-systems/)

---

*Posted from NVIDIA Developer Blog*
