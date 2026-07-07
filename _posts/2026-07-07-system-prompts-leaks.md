---
layout: post
title: "Trending: system_prompts_leaks - The Hidden Instructions Behind Every Major AI"
date: 2026-07-07 00:00:00 +0800
categories: [AI, Open Source, Security]
tags: [system-prompts, claude, chatgpt, gemini, prompt-engineering, llm, anthropic, openai, grok, reverse-engineering]
---

What if you could read the secret instruction manual behind every major AI chatbot? That's exactly what `system_prompts_leaks` by asgeirtj delivers — a meticulously maintained repository of extracted system prompts from Anthropic's Claude (Fable 5, Opus 4.8, Sonnet 5), OpenAI's ChatGPT (5.5 Thinking, Instant, Codex), Google's Gemini (3.5 Flash, 3.1 Pro), xAI's Grok, Microsoft's Copilot, Cursor, Perplexity, and dozens more. The project has been featured in The Washington Post and serves as the definitive public reference for understanding how these models are instructed to behave.

The repository is organized by vendor — Anthropic, OpenAI, Google, xAI, Meta, Microsoft, Mistral, and a Misc category covering tools like VS Code Copilot Agent, Docker Gordon AI, and even Stack Overflow's AI assist. Each entry is a raw markdown file containing the exact system prompt text, complete with tool definitions, skill manifests, and behavioral guardrails. The project has amassed an astonishing 51,500+ stars ⭐ and 8,400+ forks, with 600+ commits tracking prompt changes as models evolve. Notably, it includes diffs between model versions (e.g., Opus 4.8 → Fable 5), letting researchers pinpoint exactly what changed in Anthropic's instruction set.

Standout revelations include Claude Code's full Opus 4.8 system prompt with all 48 tools and 16 bundled skills, Claude Design's creative toolkit with 9 starter sources, GPT-5.5's multi-mode personas (Thinking, Instant, Friendly, Pragmatic), and Gemini 3.5 Flash's complete toolset configuration. The repo also preserves historical prompts across model versions — from Claude Opus 4.6 through Fable 5, and from GPT-5.3 through 5.5 — creating an invaluable longitudinal dataset for understanding how AI instruction design has evolved. Everything is released under CC0-1.0, placing it fully in the public domain.

The project's explosive growth reflects a broader hunger for transparency in AI. As these models become embedded in coding tools, creative suites, and everyday workflows, understanding their hidden instructions isn't just academic curiosity — it's essential for developers, security researchers, and anyone who wants to know what biases, limitations, and capabilities are baked into the tools they rely on. Whether you're building your own agent, studying prompt engineering, or just curious about what Claude is really told to do behind the scenes, this repo is an extraordinary window into the black box. URL: https://github.com/asgeirtj/system_prompts_leaks
