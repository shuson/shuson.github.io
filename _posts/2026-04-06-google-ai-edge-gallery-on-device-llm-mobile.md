---
layout: post
title: "Google AI Edge Gallery - Run LLMs On Your Phone"
date: 2026-04-06
categories: [AI, Machine Learning, Mobile]
tags: [google-ai-edge, gallery, gemma, on-device-ai, mobile, android, ios, llm, privacy]
---

## 🚀 Google AI Edge Gallery

**google-ai-edge/gallery** is trending at #1 on GitHub today with over 16,900 stars. It's the premier destination for running powerful open-source Large Language Models (LLMs) directly on your mobile device — fully offline, private, and lightning-fast.

### What It Is

**AI Edge Gallery** is a mobile app (Android & iOS) that brings state-of-the-art generative AI to your phone. Instead of relying on cloud APIs, you run models locally on your device hardware. The latest release features official support for **Gemma 4**, Google's cutting-edge on-device model family.

Think of it as "run ChatGPT on your phone" — but everything stays on your device, no internet required.

### Core Features

**🎯 Gemma 4 Support:**
The centerpiece of this release. Experience advanced reasoning, logic, and creative capabilities without ever sending your data to a server.

**🧩 Agent Skills:**
Transform your LLM from a conversationalist into a proactive assistant. Augment model capabilities with tools like:
- Wikipedia for fact-grounding
- Interactive maps
- Rich visual summary cards
- Modular skills from URLs or community contributions

**💭 AI Chat with Thinking Mode:**
Toggle Thinking Mode to peek "under the hood" and see the model's step-by-step reasoning process. Perfect for understanding complex problem-solving. Currently works with Gemma 4 family.

**🖼️ Ask Image:**
Use multimodal power to:
- Identify objects
- Solve visual puzzles
- Get detailed descriptions using your device's camera or photo gallery

**🎙️ Audio Scribe:**
Transcribe and translate voice recordings into text in real-time using high-efficiency on-device language models.

**🧪 Prompt Lab:**
A dedicated workspace to test different prompts with granular control over model parameters like temperature and top-k.

**📱 Mobile Actions:**
Unlock offline device controls and automated tasks powered by a finetune of FunctionGemma 270m.

**🌱 Tiny Garden:**
A fun, experimental mini-game that uses natural language to plant and harvest a virtual garden (also powered by FunctionGemma 270m).

**📊 Model Management & Benchmark:**
- Download models from the built-in list or load your own custom models
- Manage your model library effortlessly
- Run benchmark tests to understand how each model performs on your specific hardware

### Privacy & Security

**🔒 100% On-Device Privacy:**
All model inferences happen directly on your device hardware. No internet is required, ensuring total privacy for your prompts, images, and sensitive data.

### Platform Requirements

**OS Requirements:**
- **Android:** 12 and up
- **iOS:** 17 and up

**Installation:**
- [Google Play Store](https://play.google.com/store/apps/details?id=com.google.ai.edge.gallery)
- [Apple App Store](https://apps.apple.com/us/app/google-ai-edge-gallery/id6749645337)
- For users without Google Play: install APK from [latest release](https://github.com/google-ai-edge/gallery/releases/latest/)

### Why It Stands Out

**📱 True Mobile AI:**
- Native mobile app (not a web wrapper)
- Optimized for mobile hardware
- Works completely offline

**🔒 Privacy-First:**
- No data leaves your device
- No cloud dependency
- Perfect for sensitive use cases

**🎯 Feature-Rich:**
- Not just chat — agent skills, image analysis, audio transcription
- Thinking Mode for transparency
- Prompt Lab for experimentation
- Model benchmarking tools

**🆓 Free & Open Source:**
- Apache 2.0 licensed
- Community-driven development
- Regular updates from Google AI Edge team

### When to Use AI Edge Gallery

**Use AI Edge Gallery if:**
- You want to run LLMs on your phone without cloud APIs
- Privacy is a concern (sensitive data, confidential prompts)
- You need offline AI capabilities (travel, remote areas)
- You want to experiment with Gemma 4 and other open models
- You're building mobile apps with on-device AI features

**Skip AI Edge Gallery if:**
- You need the absolute largest models (mobile has memory constraints)
- Your device doesn't meet OS requirements (Android 12+ / iOS 17+)
- You prefer cloud-based AI with unlimited context windows

### Tips & Gotchas

**Model Selection:**
- Start with smaller models to test performance on your device
- Larger models provide better quality but consume more memory and battery
- Check the built-in model list for compatibility with your device

**Battery & Performance:**
- On-device inference can drain battery faster than cloud APIs
- First inference may be slower (model loading)
- Subsequent requests benefit from caching

**Storage:**
- Models can take significant storage space (hundreds of MB to several GB)
- You can download/unload models as needed
- Manage your model library in the app settings

### Built With

- **Kotlin** - Primary Android implementation
- **Swift** - iOS implementation
- **LiteRT** - Google's lightweight runtime for optimized model execution
- **Gemma** - Google's open model family
- **LiteRT-LM** - C++ inference engine

### Repository & Resources

- [google-ai-edge/gallery](https://github.com/google-ai-edge/gallery)
- [Project Wiki (Detailed Guides)](https://github.com/google-ai-edge/gallery/wiki)
- [LiteRT-LM](https://github.com/google-ai-edge/LiteRT-LM)
- [Hugging Face LiteRT Community](https://huggingface.co/litert-community)
- [Google AI Edge Documentation](https://ai.google.dev/edge)
- [Development Notes](https://github.com/google-ai-edge/gallery/blob/main/DEVELOPMENT.md)

---

*Posted from GitHub Trending - On-Device AI for Mobile with Google AI Edge Gallery*
