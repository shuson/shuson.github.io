---
layout: post
title: "Hermes Agent - The Self-Improving AI Agent That Learns From Experience"
date: 2026-04-10
categories: [AI, Agent Frameworks, Open Source]
tags: [hermes-agent, nous-research, ai-agent, self-improving, openclaw, telegram, automation]
---

## 🚀 Hermes Agent

**NousResearch/hermes-agent** is the #1 trending repo on GitHub today with over **44,000 stars** and a massive **6,485 stars gained in 24 hours**. Built by [Nous Research](https://nousresearch.com), it's a self-improving AI agent with a built-in learning loop that creates skills from experience and gets smarter over time.

### What It Is

Hermes Agent is **the only agent with a built-in learning loop**. Unlike static AI assistants, it:

- **Creates skills from experience** — autonomously builds new capabilities after complex tasks
- **Improves skills during use** — refines its own tools as it works
- **Persists knowledge across sessions** — nudges itself to remember what matters
- **Searches its own conversation history** — FTS5 session search with LLM summarization
- **Builds a model of who you are** — uses [Honcho](https://github.com/plastic-labs/honcho) for dialectic user modeling

### Key Features

| Feature | Description |
|---------|-------------|
| **Real Terminal Interface** | Full TUI with multiline editing, slash-command autocomplete, streaming tool output |
| **Live Where You Do** | Telegram, Discord, Slack, WhatsApp, Signal — all from a single gateway process |
| **Closed Learning Loop** | Agent-curated memory, autonomous skill creation, skills self-improve during use |
| **Scheduled Automations** | Built-in cron scheduler with delivery to any platform |
| **Delegates & Parallelizes** | Spawn isolated subagents for parallel workstreams |
| **Runs Anywhere** | Local, Docker, SSH, Daytona, Singularity, Modal — even on a $5 VPS |
| **Model Agnostic** | Use any model via OpenRouter (200+), Nous Portal, z.ai/GLM, Kimi, MiniMax, OpenAI |

### Why It Matters

Most AI agents are stateless — they forget everything after each session. Hermes is different:

```bash
# Quick install
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

# Start chatting
hermes

# Configure your model
hermes model

# Start the messaging gateway
hermes gateway
```

The agent runs as a gateway process that you can talk to from Telegram while it works on a cloud VM. It's compatible with the [agentskills.io](https://agentskills.io) open standard and can even migrate from OpenClaw automatically.

### The Learning Loop

Hermes doesn't just execute tasks — it learns from them:

1. **Experience** — completes a complex task
2. **Skill Creation** — autonomously creates a new skill from the experience
3. **Improvement** — refines that skill during subsequent uses
4. **Memory** — persists knowledge with periodic nudges to remember
5. **User Modeling** — builds a deeper understanding of your preferences over time

This means the agent gets genuinely better the more you use it, rather than staying static.

### Quick Reference

| Action | CLI | Messaging |
|--------|-----|-----------|
| Start chatting | `hermes` | Send bot a message |
| Fresh conversation | `/new` or `/reset` | `/new` or `/reset` |
| Change model | `/model [provider:model]` | `/model [provider:model]` |
| Browse skills | `/skills` | `/skills` |
| Interrupt work | `Ctrl+C` | `/stop` |

### Documentation

Full documentation lives at **[hermes-agent.nousresearch.com/docs](https://hermes-agent.nousresearch.com/docs/)** with guides for:

- Quickstart (2-minute setup)
- CLI usage and keybindings
- Messaging gateway (Telegram, Discord, etc.)
- Security and command approval
- Tools & 40+ built-in capabilities
- Skills system and procedural memory
- MCP integration for extended capabilities
- Cron scheduling for automations

### Installation

Works on Linux, macOS, WSL2, and Android (via Termux):

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
source ~/.bashrc    # or: source ~/.zshrc
hermes              # start chatting!
```

For Windows users: install [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) first, then run the command above.

---

**Repo:** [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)  
**Stars:** 44,159+ (6,485 today)  
**License:** MIT
