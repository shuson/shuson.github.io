---
layout: post
title: "LiteRT-LM - Google's High-Performance On-Device LLM Inference Framework"
date: 2026-04-08
categories: [AI, Machine Learning, Edge Computing]
tags: [litert-lm, google, on-device-ai, gemma, edge-ml, mobile-ai, llm-inference, android, ios]
---

## 🚀 LiteRT-LM

**google-ai-edge/LiteRT-LM** is trending at #2 on GitHub today with over 2,500 stars and 528 stars gained today. It's Google's production-ready, high-performance, open-source inference framework for deploying Large Language Models on edge devices — from phones and wearables to Raspberry Pi and browsers.

### What It Is

**LiteRT-LM** brings state-of-the-art language models to edge devices with stellar performance. Deploy [Gemma 4](https://blog.google/innovation-and-ai/technology/developers-tools/gemma-4/) and other models (Llama, Phi-4, Qwen) across Android, iOS, Web, Desktop, and IoT with hardware acceleration via GPU and NPU.

Think of it as the bridge between cutting-edge AI models and real-world deployment — no cloud required, everything runs locally on your device.

### Core Features

**📱 Cross-Platform Support:**
- **Android** — Kotlin API (stable)
- **iOS/macOS** — Swift (in development)
- **Web** — Browser-based inference
- **Desktop** — Windows, macOS, Linux
- **IoT** — Raspberry Pi and embedded devices

**🚀 Hardware Acceleration:**
- GPU acceleration for peak performance
- NPU support for Gemma models (v0.7.0+)
- Optimized for mobile and edge hardware
- Desktop GPU support (v0.8.0+)

**👁️ Multi-Modality:**
- Vision inputs supported (v0.8.0+)
- Audio inputs supported
- Perfect for multimodal AI applications

**🔧 Tool Use & Function Calling:**
- Built-in function calling support
- Agentic workflows enabled
- Fine-tune FunctionGemma for custom tools
- Improved capabilities in v0.9.0+

**📚 Broad Model Support:**
- **Gemma** — Google's open models (including Gemma 4)
- **Llama** — Meta's Llama family
- **Phi-4** — Microsoft's efficient models
- **Qwen** — Alibaba's model series
- And more via HuggingFace

### Quick Start

**Install the CLI (no code required):**

```bash
# Install via uv
uv tool install litert-lm

# Run a model directly from HuggingFace
litert-lm run \
  --from-huggingface-repo=litert-community/gemma-4-E2B-it-litert-lm \
  gemma-4-E2B-it.litertlm \
  --prompt="What is the capital of France?"
```

That's it — you're running an LLM locally without writing a single line of code.

### Platform Requirements

**Language Bindings:**

| Language | Status | Best For |
|----------|--------|----------|
| **Kotlin** | ✅ Stable | Android apps & JVM |
| **Python** | ✅ Stable | Prototyping & Scripting |
| **C++** | ✅ Stable | High-performance native |
| **Swift** | 🚀 In Dev | Native iOS & macOS |

**Installation:**
```bash
# Python
pip install litert-lm

# Or use uv for faster installs
uv tool install litert-lm
```

**System Requirements:**
- Linux, macOS, Windows (WSL), or Raspberry Pi
- Sufficient RAM for your chosen model size
- GPU/NPU drivers for hardware acceleration

### Why It Stands Out

**🎯 Production-Ready:**
- Already powers on-device GenAI in Chrome, Chromebook Plus, and Pixel Watch
- Battle-tested at Google scale
- Regular releases with active development

**🚀 No Cloud Dependency:**
- Everything runs locally on your device
- No API calls, no latency, no privacy concerns
- Perfect for offline or low-connectivity scenarios

**📊 Stellar Performance:**
- Optimized for edge hardware
- Hardware acceleration via GPU/NPU
- Quantization support for smaller models

**🔧 Developer-Friendly:**
- CLI for quick experimentation
- Language-specific guides for each platform
- Active documentation and blog posts
- Google AI Edge Gallery app for instant testing

### When to Use LiteRT-LM

**Use LiteRT-LM if:**
- You need on-device LLM inference (privacy, latency, offline)
- You're building mobile apps with AI features
- You want to deploy Gemma 4 or other open models locally
- You need hardware acceleration on edge devices
- You're working on IoT or embedded AI projects

**Skip LiteRT-LM if:**
- You need the absolute largest models (100B+ parameters)
- You prefer cloud-based inference (simpler, no device constraints)
- Your target devices lack sufficient compute/RAM
- You need Swift bindings immediately (still in development)

### Tips & Gotchas

**Getting Started:**
- Try the [Google AI Edge Gallery](https://github.com/google-ai-edge/gallery) app first — instant on-device model testing
- Start with smaller models (e.g., Gemma 3n E2B int4) for faster iteration
- Use the CLI for prototyping before integrating into your app

**Performance Optimization:**
- Enable GPU/NPU acceleration for best performance
- Use quantized models (int4) for faster inference on edge devices
- Check the [Technical Overview](https://ai.google.dev/edge/litert-lm/overview) for benchmarks

**Model Selection:**
- Gemma 4 offers the latest capabilities with agentic skills
- Gemma 3n is optimized for mobile/edge with great performance
- Check HuggingFace for community-converted LiteRT-LM models

**Version History:**
- **v0.10.1** — Gemma 4 support + LiteRT-LM CLI
- **v0.9.0** — Improved function calling
- **v0.8.0** — Desktop GPU + Multi-Modality
- **v0.7.0** — NPU acceleration for Gemma

### Built With

- **C++** — Core inference engine
- **Kotlin** — Android bindings
- **Python** — Python API
- **C++** — Native high-performance API
- **Swift** — iOS/macOS (in development)

### Repository & Resources

- [google-ai-edge/LiteRT-LM](https://github.com/google-ai-edge/LiteRT-LM)
- [Product Website](https://ai.google.dev/edge/litert-lm)
- [CLI Guide](https://ai.google.dev/edge/litert-lm/cli)
- [Technical Overview](https://ai.google.dev/edge/litert-lm/overview)
- [Android (Kotlin) Guide](https://ai.google.dev/edge/litert-lm/android)
- [Python Guide](https://ai.google.dev/edge/litert-lm/python)
- [C++ Guide](https://ai.google.dev/edge/litert-lm/cpp)
- [Google AI Edge Gallery App](https://github.com/google-ai-edge/gallery)
- [Gemma 4 Blog](https://developers.googleblog.com/bring-state-of-the-art-agentic-skills-to-the-edge-with-gemma-4/)

---

*Posted from GitHub Trending - On-Device AI with Google's LiteRT-LM*
