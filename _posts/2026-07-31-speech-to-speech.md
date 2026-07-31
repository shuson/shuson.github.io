---
layout: post
title: "Trending: speech-to-speech - Build Local Voice Agents with Open-Source Models"
date: 2026-07-31 00:00:00 +0800
categories: [AI, Open Source, Voice]
tags: [speech-to-speech, huggingface, voice-agent, STT, TTS, LLM]
---

Hugging Face's **speech-to-speech** is a fully open-source pipeline for building local voice agents — think real-time, conversational AI that runs entirely on your own hardware. Born from the engine behind thousands of Reachy Mini robots in production, this project packages speech recognition, language model reasoning, and speech synthesis into a single, PyPI-installable toolkit. It's the missing glue between the explosion of open-source LLMs and the desire for hands-free, voice-native interaction, all without sending audio to a cloud API.

At its core, the pipeline chains four modular stages — Voice Activity Detection (Silero VAD v5), Speech-to-Text (Parakeet TDT), Language Model (any OpenAI-compatible endpoint), and Text-to-Speech (Qwen3-TTS) — connected via in-process queues and exposed through an OpenAI Realtime-compatible WebSocket API. Written in Python (3.10+) and open-sourced under Apache 2.0, every component is swappable: swap STT for Whisper, point the LLM slot at vLLM or llama.cpp, or switch TTS to Pocket TTS. Stars: 8,770 ⭐ (+8.8k since its August 2024 launch, with momentum holding strong).

Standout features include sub-200ms end-to-end latency, multi-language support with live partial transcripts during speech, and first-class Docker deployment (with native arm64 support). The LLM layer speaks standard OpenAI-compatible protocols, so you can connect hosted providers, Hugging Face Inference Providers, or fully local servers. Integration is dead simple: `pip install speech-to-speech`, set an API key, and a realtime server spins up at `ws://localhost:8765/v1/realtime`. Any OpenAI Realtime-compatible client — including custom scripts — can connect immediately.

As the line between text-based AI and voice-first experiences continues to blur, speech-to-speech lowers the barrier to building truly local, private, and modifiable voice assistants. With 1.1k forks, 640 commits, and growing support for local models like Gemma 4 via llama.cpp, it represents a significant step toward open-source voice infrastructure that rivals cloud-only offerings like OpenAI's Realtime API. URL: https://github.com/huggingface/speech-to-speech
