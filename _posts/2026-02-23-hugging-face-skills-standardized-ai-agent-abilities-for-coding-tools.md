---
layout: post
title: "Hugging Face Skills: Standardized AI Agent Abilities for Coding Tools"
tags:
    - AI
    - ML
    - Hugging Face
    - coding agents
    - open-source
    - github-trending
---

Today's #1 trending repo on GitHub is [Hugging Face Skills](https://github.com/huggingface/skills), a collection of standardized skill definitions that enable AI coding agents (Claude Code, OpenAI Codex, Gemini CLI, Cursor) to perform complex ML tasks effortlessly.

## What Are Hugging Face Skills?

Skills are self-contained folders that package instructions, scripts, and resources for specific AI/ML use cases. Each skill includes a `SKILL.md` file with YAML frontmatter and detailed guidance that coding agents follow while the skill is active.

The repository provides a **plugin marketplace** experience where you can install skills directly into your coding agent. Once installed, the agent automatically loads the skill's instructions and helper scripts when you mention it in your queries.

## Available Skills

The repo currently offers 8 powerful skills:

| Skill | Purpose |
|-------|---------|
| `hugging-face-cli` | Execute Hub operations via hf CLI (download/upload models/datasets, manage repos, run compute jobs) |
| `hugging-face-datasets` | Create and manage datasets on Hugging Face Hub with streaming updates and SQL querying |
| `hugging-face-evaluation` | Add evaluation results to model cards, import scores, and run custom evaluations with vLLM |
| `hugging-face-jobs` | Run and monitor compute jobs on Hugging Face infrastructure |
| `hugging-face-model-trainer` | Train/fine-tune LLMs using TRL (SFT, DPO, GRPO) with hardware selection and cost estimation |
| `hugging-face-paper-publisher` | Publish research papers on Hugging Face Hub and link them to models/datasets |
| `hugging-face-tool-builder` | Build reusable scripts for chaining Hugging Face API calls |
| `hugging-face-trackio` | Track and visualize ML training experiments with real-time dashboards |

## How to Install

### Claude Code
```bash
/plugin marketplace add huggingface/skills
/plugin install <skill-name>@huggingface/skills
```

### OpenAI Codex
Codex auto-detects skills via `AGENTS.md` file in the repo.

### Gemini CLI
```bash
gemini extensions install https://github.com/huggingface/skills.git --consent
```

### Cursor
Install via Cursor's plugin flow using the repository URL.

## Why It's Interesting

Hugging Face Skills standardize how AI agents interact with the Hugging Face ecosystem. Instead of manually crafting CLI commands or API calls, you can simply say: *"Use the HF model trainer skill to estimate GPU memory for a 70B model"* — and the agent handles the complexity.

This bridges the gap between natural language instructions and reproducible ML workflows, making advanced capabilities accessible to developers who may not be experts in MLOps. The skills are open source (Apache 2.0) and extensible — you can create custom skills by copying existing folders and updating their `SKILL.md` files.

Licensed under Apache 2.0. Contribute or explore: [github.com/huggingface/skills](https://github.com/huggingface/skills)
