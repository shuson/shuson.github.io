---
layout: post
title: "AIRI: Self-Hosted AI Companion Inspired by Neuro-sama"
tags:
    - ai
    - llm
    - vtuber
    - open-source
    - github-trending
---

Today's top trending repo on GitHub is [AIRI](https://github.com/moeru-ai/airi) by moeru-ai, an open-source project recreating Neuro-sama — a self-hosted AI companion capable of real-time voice chat, playing games like Minecraft and Factorio, and interacting across Discord and Telegram.

## What is AIRI?

AIRI is a **self-hosted AI companion project** inspired by [Neuro-sama](https://www.youtube.com/@Neurosama), the famous AI VTuber who can play games, chat, and interact with viewers in real-time. Unlike closed-source alternatives, AIRI lets you **own your digital companion** — running locally on your machine, available 24/7, not just during scheduled streams.

Think of it as **your own Neuro-sama** that lives on your computer, can see what you're coding, play games with you, and chat across multiple platforms — all while respecting your privacy and running on your terms.

## Key Features

### 🧠 Brain Capabilities

- **Multi-LLM Support** — Works with Claude, GPT, Gemini, Qwen, DeepSeek, Ollama, and 20+ providers via [xsAI](https://github.com/moeru-ai/xsai)
- **Game Playing** — Can play Minecraft and Factorio autonomously
- **Memory System** — In-browser database support (DuckDB WASM, Pglite) with persistent memory (WIP)
- **Multi-Platform Chat** — Native integration with Discord and Telegram

### 👂 Ears (Input)

- **Real-time Voice Chat** — Browser audio input with client-side speech recognition
- **Talking Detection** — Automatically detects when you're speaking
- **Discord Voice** — Can join Discord voice channels and listen

### 🗣️ Mouth (Output)

- **ElevenLabs TTS** — High-quality voice synthesis
- **Lip Sync** — Synchronized with speech output

### 💃 Body (Visual)

- **VRM Support** — Full 3D avatar control with auto-blink, look-at, and idle animations
- **Live2D Support** — 2D VTuber model integration with expressive animations
- **WebGPU Acceleration** — Runs in browsers using modern web technologies

## Quick Start

### Browser Version

```bash
git clone https://github.com/moeru-ai/airi.git
cd airi
pnpm i
pnpm dev
```

Access at [https://airi.moeru.ai](https://airi.moeru.ai)

### Desktop Version

```bash
pnpm dev:tamagotchi
```

### Mobile Version

```bash
pnpm dev:pocket
```

## Supported LLM Providers

AIRI supports 20+ LLM providers including OpenAI, Anthropic Claude, Google Gemini, DeepSeek, Qwen, xAI (Grok), Ollama (local), vLLM, Groq, Mistral, and more.

## Why It Matters

Neuro-sama is the most advanced AI VTuber but only available during live streams and not open source. AIRI changes this by offering:

1. **24/7 Availability** — Your companion is always online
2. **Self-Hosted Privacy** — Runs locally; conversations stay with you
3. **Customization** — Change models, voices, personalities
4. **Extensibility** — Plugin system for new features

## Current Status

**Completed:** LLM integration, Minecraft/Factorio gameplay, Discord/Telegram chat, VRM/Live2D support, real-time voice chat, auto-animations

**In Progress:** Persistent memory system, in-browser WebGPU inference, enhanced Factorio integration

---

**Explore the project:** [github.com/moeru-ai/airi](https://github.com/moeru-ai/airi)

**Try it online:** [airi.moeru.ai](https://airi.moeru.ai)

**Discord:** [Join the server](https://discord.gg/TgQ3Cu2F7A)
