---
layout: post
title: "Heretic: Fully Automatic Censorship Removal for Language Models"
tags:
    - LLM
    - AI
    - open-source
    - abliteration
    - uncensored
    - python
    - github-trending
---

Today's #1 trending repo on GitHub is [Heretic](https://github.com/p-e-w/heretic), a tool that automatically removes censorship ("safety alignment") from transformer-based language models — without expensive post-training or fine-tuning.

## What is Heretic?

Heretic implements an advanced version of **directional ablation** (aka "abliteration"), a technique that identifies the "refusal direction" in a model's internal representations and orthogonalizes weight matrices to suppress it. The key innovation is that it's fully automated: Heretic uses a TPE-based parameter optimizer (powered by [Optuna](https://optuna.org/)) to find optimal ablation parameters by co-minimizing refusal rate and KL divergence from the original model.

The result? A decensored model that retains as much of the original intelligence as possible — with zero human tuning required.

## How It Works

1. Computes "refusal directions" for each layer by comparing hidden states for harmful vs. harmless prompts
2. Orthogonalizes attention and MLP weight matrices against those directions
3. Optimizes ablation weight kernels (shape, position, intensity) per component
4. Uses fractional direction indices with linear interpolation to explore directions beyond individual layers

## Usage

```bash
pip install -U heretic-llm
heretic Qwen/Qwen3-4B-Instruct-2507
```

That's it. The process is fully automatic — no configuration needed. After processing, you can save the model locally, upload to Hugging Face, or chat with it immediately.

## Why It's Interesting

Manual abliteration requires understanding transformer internals and careful parameter tuning. Heretic achieves comparable or better results automatically. For example, on Gemma-3-12B-it, the Heretic version matched other expert abliterations at 3/100 refusals while achieving a KL divergence of just 0.16 (vs. 0.45–1.04 for manual versions) — meaning less damage to the model's capabilities.

The community has already published [over 1,000 models](https://huggingface.co/models?other=heretic) using Heretic. It supports most dense models including multimodal ones, and several MoE architectures. Licensed under AGPL-3.0.

Check it out: [github.com/p-e-w/heretic](https://github.com/p-e-w/heretic)
