---
layout: post
title: "Voicebox - Open-Source Voice Synthesis Studio"
date: 2026-04-15
categories: [AI, Developer Tools, Open Source, Audio]
tags: [voicebox, tts, voice-cloning, speech-synthesis, audio, elevenlabs-alternative, local-first]
---

## 🎙️ Voicebox

**jamiepine/voicebox** is the #3 trending repo on GitHub today with over **17,300 stars** and **1,162 stars gained in 24 hours**. It's an **open-source voice synthesis studio** — a free, local-first alternative to ElevenLabs that runs entirely on your machine.

### What It Is

Voicebox is a desktop app for voice cloning and speech generation. Clone voices from seconds of audio, generate speech in 23 languages across 5 TTS engines, apply post-processing effects, and compose multi-voice projects with a timeline editor. All your models and voice data stay local — complete privacy, no cloud uploads.

Think of it as **ElevenLabs but open-source and offline** — built with Tauri (Rust) for native performance, not Electron.

### Key Features

**5 TTS Engines** — Switch between Qwen3-TTS, LuxTTS, Chatterbox Multilingual, Chatterbox Turbo, and HumeAI TADA. Each has different strengths:

| Engine | Languages | Strengths |
|--------|-----------|-----------|
| Qwen3-TTS | 10 | High-quality multilingual cloning, delivery instructions |
| LuxTTS | English | Lightweight (~1GB VRAM), 150x realtime on CPU |
| Chatterbox Multilingual | 23 | Broadest language coverage (Arabic, Hindi, Swahili, etc.) |
| Chatterbox Turbo | English | Fast 350M model with paralinguistic tags |
| TADA | 10 | HumeAI model — 700s+ coherent audio |

**Expressive Speech** — Use paralinguistic tags like `[laugh]`, `[sigh]`, `[gasp]`, `[cough]` inline with text (Chatterbox Turbo). The model synthesizes these emotions naturally.

**Post-Processing Effects** — 8 audio effects powered by Spotify's Pedalboard library:

- Pitch Shift (±12 semitones)
- Reverb (configurable room size)
- Delay (echo with feedback)
- Chorus/Flanger
- Compressor
- Gain
- High-Pass / Low-Pass Filters

Ships with 4 built-in presets (Robotic, Radio, Echo Chamber, Deep Voice) and supports custom presets.

**Voice Cloning** — Create profiles from audio files or record directly in-app. Multi-sample support for higher quality. Import/export profiles to share or back up.

**Multi-Track Timeline** — Compose conversations, podcasts, and narratives with drag-and-drop multi-track editing. Inline trimming, synchronized playback, version pinning per clip.

**Auto-Chunking** — Generate unlimited-length scripts. Text is split at sentence boundaries, generated independently, then crossfaded together. Supports up to 50,000 characters.

**REST API** — Full HTTP API for integrating voice synthesis into your own apps:

```bash
# Generate speech
curl -X POST http://localhost:17493/generate \
  -H "Content-Type: application/json" \
  -d '{"text": "Hello world", "profile_id": "abc123", "language": "en"}'

# List voice profiles
curl http://localhost:17493/profiles
```

### Platform Support

| Platform | Backend | Notes |
|----------|---------|-------|
| macOS (Apple Silicon) | MLX (Metal) | 4-5x faster via Neural Engine |
| Windows / Linux (NVIDIA) | PyTorch (CUDA) | Auto-downloads CUDA binary |
| Linux (AMD) | PyTorch (ROCm) | Auto-configures HSA_OVERRIDE_GFX_VERSION |
| Windows (any GPU) | DirectML | Universal Windows GPU support |
| Intel Arc | IPEX/XPU | Intel discrete GPU acceleration |
| Any | CPU | Works everywhere, just slower |

### Quick Install

**Download:** [voicebox.sh/download](https://voicebox.sh/download)

- **macOS (Apple Silicon):** [Download DMG](https://voicebox.sh/download/mac-arm)
- **macOS (Intel):** [Download DMG](https://voicebox.sh/download/mac-intel)
- **Windows:** [Download MSI](https://voicebox.sh/download/windows)
- **Docker:** `docker compose up`
- **Linux:** Build from source (see [linux-install guide](https://voicebox.sh/linux-install))

### Getting Started

1. **Download and install** for your platform
2. **Create a voice profile** — import audio or record in-app
3. **Type your text** — add expressive tags like `[laugh]` if desired
4. **Generate** — select engine, language, and hit generate
5. **Apply effects** — tweak with built-in presets or custom chains
6. **Export** — save as WAV/MP3 or add to timeline project

### Architecture

| Layer | Technology |
|-------|------------|
| Desktop App | Tauri (Rust) |
| Frontend | React, TypeScript, Tailwind CSS |
| State | Zustand, React Query |
| Backend | FastAPI (Python) |
| TTS Engines | Qwen3-TTS, LuxTTS, Chatterbox, TADA |
| Effects | Pedalboard (Spotify) |
| Transcription | Whisper / Whisper Turbo |
| Inference | MLX (Apple) / PyTorch (CUDA/ROCm) |
| Database | SQLite |

### Why It Matters

Voicebox brings **professional voice synthesis to your local machine** — no subscriptions, no API limits, no privacy concerns. Whether you're building:

- **Game dialogue** — generate NPC voices dynamically
- **Podcast production** — clone voices, apply effects, export episodes
- **Accessibility tools** — text-to-speech for screen readers
- **Content automation** — batch-generate audio from scripts
- **Voice assistants** — integrate via the REST API

The multi-engine architecture means you can pick the right model for each job — lightweight LuxTTS for quick iterations, Qwen3-TTS for quality, Chatterbox for language coverage.

And because it's **open-source**, you can extend it: add new TTS engines, build custom effects, or integrate with your own apps via the API.

---

**Repo:** [jamiepine/voicebox](https://github.com/jamiepine/voicebox)  
**Stars:** 17,300+ (1,162 today)  
**License:** MIT  
**Website:** [voicebox.sh](https://voicebox.sh)  
**Docs:** [docs.voicebox.sh](https://docs.voicebox.sh)  
**Download:** [voicebox.sh/download](https://voicebox.sh/download)
