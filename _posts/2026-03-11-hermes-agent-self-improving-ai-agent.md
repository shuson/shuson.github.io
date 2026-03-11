---
layout: post
title: "Hermes Agent - The Self-Improving AI Agent That Grows With You"
date: 2026-03-11
categories: [AI, Agents, Infrastructure]
tags: [ai-agent, nous-research, self-improving, telegram, discord, cron, skills]
---

## 🤖 Hermes Agent

**Hermes Agent** is a self-improving AI agent built by [Nous Research](https://nousresearch.com) — the only agent with a built-in learning loop that creates skills from experience, improves them during use, and builds a deepening model of who you are across sessions.

### What Makes It Different

Unlike static AI assistants, Hermes has a **closed learning loop**:

- **Autonomous skill creation** — After complex tasks, it creates new skills automatically
- **Self-improvement during use** — Skills get better the more you use them
- **Agent-curated memory** — Periodic nudges help persist important knowledge
- **Cross-session search** — FTS5 session search with LLM summarization for recalling past conversations
- **User modeling** — [Honcho](https://github.com/plastic-labs/honcho) dialectic user modeling to understand you better

### Key Features

**1. Model Agnostic**
Use any model you want — [Nous Portal](https://portal.nousresearch.com), [OpenRouter](https://openrouter.ai) (200+ models), z.ai/GLM, Kimi/Moonshot, MiniMax, OpenAI, or your own endpoint. Switch with `hermes model` — no code changes, no lock-in.

**2. Full Terminal Interface**
Real TUI with multiline editing, slash-command autocomplete, conversation history, interrupt-and-redirect, and streaming tool output.

**3. Multi-Platform Messaging**
Lives where you do — Telegram, Discord, Slack, WhatsApp, Signal, and CLI, all from a single gateway process. Voice memo transcription and cross-platform conversation continuity included.

**4. Scheduled Automations**
Built-in cron scheduler with delivery to any platform. Daily reports, nightly backups, weekly audits — all in natural language, running unattended.

**5. Subagent Delegation**
Spawn isolated subagents for parallel workstreams. Write Python scripts that call tools via RPC, collapsing multi-step pipelines into zero-context-cost turns.

**6. Runs Anywhere**
Six terminal backends — local, Docker, SSH, Daytona, Singularity, and Modal. Daytona and Modal offer serverless persistence — your agent's environment hibernates when idle and wakes on demand, costing nearly nothing between sessions. Run it on a $5 VPS or a GPU cluster.

**7. Research-Ready**
Batch trajectory generation, Atropos RL environments, trajectory compression for training the next generation of tool-calling models.

### Quick Start

**Installation (Linux, macOS, WSL2):**

```bash
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
source ~/.bashrc  # or: source ~/.zshrc
hermes setup      # configure your LLM provider
hermes            # start chatting!
```

*Note: Native Windows is not supported. Install [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) first.*

**Basic Commands:**

```bash
hermes            # Interactive CLI — start a conversation
hermes model      # Switch provider or model
hermes setup      # Re-run the setup wizard
hermes gateway    # Start the messaging gateway (Telegram, Discord, etc.)
hermes update     # Update to the latest version
hermes doctor     # Diagnose any issues
```

### Documentation

All documentation lives at [hermes-agent.nousresearch.com/docs](https://hermes-agent.nousresearch.com/docs/):

| Section | What's Covered |
|---------|----------------|
| [Quickstart](https://hermes-agent.nousresearch.com/docs/getting-started/quickstart) | Install → setup → first conversation in 2 minutes |
| [CLI Usage](https://hermes-agent.nousresearch.com/docs/user-guide/cli) | Commands, keybindings, personalities, sessions |
| [Configuration](https://hermes-agent.nousresearch.com/docs/user-guide/configuration) | Config file, providers, models, all options |
| [Messaging Gateway](https://hermes-agent.nousresearch.com/docs/user-guide/messaging) | Telegram, Discord, Slack, WhatsApp, Signal, Home Assistant |
| [Security](https://hermes-agent.nousresearch.com/docs/user-guide/security) | Command approval, DM pairing, container isolation |
| [Tools & Toolsets](https://hermes-agent.nousresearch.com/docs/user-guide/features/tools) | 40+ tools, toolset system, terminal backends |
| [Skills System](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills) | Procedural memory, Skills Hub, creating skills |
| [Memory](https://hermes-agent.nousresearch.com/docs/user-guide/features/memory) | Persistent memory, user profiles, best practices |
| [MCP Integration](https://hermes-agent.nousresearch.com/docs/user-guide/features/mcp) | Connect any MCP server for extended capabilities |
| [Cron Scheduling](https://hermes-agent.nousresearch.com/docs/user-guide/features/cron) | Scheduled tasks with platform delivery |
| [Architecture](https://hermes-agent.nousresearch.com/docs/developer-guide/architecture) | Project structure, agent loop, key classes |
| [Contributing](https://hermes-agent.nousresearch.com/docs/developer-guide/contributing) | Development setup, PR process, code style |

### Why It Matters

Hermes represents a shift from **static AI assistants** to **evolving companions**. Most agents are frozen in time — they don't learn from your interactions, don't remember your preferences across sessions, and don't get better at helping you specifically. Hermes changes that with:

1. **Persistent learning** — Skills and memories that compound over time
2. **True multi-platform** — One agent, everywhere you communicate
3. **Infrastructure flexibility** — From $5 VPS to GPU clusters, serverless to local
4. **No vendor lock-in** — Switch models/providers without rewriting anything

### For Contributors

```bash
git clone --recurse-submodules https://github.com/NousResearch/hermes-agent.git
cd hermes-agent
curl -LsSf https://astral.sh/uv/install.sh | sh
uv venv .venv --python 3.11
source .venv/bin/activate
uv pip install -e ".[all,dev]"
uv pip install -e "./mini-swe-agent"
python -m pytest tests/ -q
```

### Repository Stats

- **Author:** NousResearch (Nous Research)
- **Stars:** 3,729+
- **Forks:** 475+
- **Stars Today:** 781
- **Primary Language:** Python
- **License:** MIT

### Links & Resources

- [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)
- [hermes-agent.nousresearch.com/docs](https://hermes-agent.nousresearch.com/docs/) — Full documentation
- [Nous Research](https://nousresearch.com) — Creator
- [Discord Community](https://discord.gg/NousResearch)
- [Skills Hub](https://agentskills.io) — Open standard for agent skills

---

*Posted from GitHub Trending — AI Agent/Infrastructure*
