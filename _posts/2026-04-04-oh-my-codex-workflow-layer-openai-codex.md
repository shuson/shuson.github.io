---
layout: post
title: "Oh My Codex (OMX) - Workflow Layer for OpenAI Codex CLI"
date: 2026-04-04
categories: [Developer Tools, AI, CLI]
tags: [oh-my-codex, omx, openai-codex, agent-workflow, typescript, cli]
---

## 🚀 Oh My Codex (OMX)

**Yeachan-Heo/oh-my-codex** is trending #1 on GitHub today with over 14,000 stars and 3,000+ stars gained in the last 24 hours. It's a powerful workflow layer for OpenAI's Codex CLI that adds agent teams, hooks, HUDs, and structured workflows.

### What It Is

**Oh My Codex (OMX)** is not a replacement for Codex — it's a workflow enhancement layer that sits on top of the OpenAI Codex CLI. It provides a consistent, structured approach to working with Codex by adding:

- **Canonical workflows** built around `$deep-interview`, `$ralplan`, `$team`, and `$ralph`
- **Specialist agent roles** and supporting skills
- **Project guidance** through scoped AGENTS.md files
- **Durable state** under `.omx/` for plans, logs, memory, and runtime tracking

Think of it as "better task routing + better workflow + better runtime" for Codex users.

### Core Features

**🎯 Canonical Workflow:**

```bash
# 1. Clarify scope when request is vague
$deep-interview "clarify the authentication change"

# 2. Approve implementation plan and tradeoffs
$ralplan "approve the safest implementation path"

# 3. Execute with persistent completion loop
$ralph "carry the approved plan to completion"

# 4. Or use coordinated parallel execution for big tasks
$team 3:executor "execute the approved plan in parallel"
```

**🤖 Agent Teams:**
- Run multiple agents in coordinated parallel execution
- Durable tmux-based team runtime on macOS/Linux
- psmux support for Windows
- Team state persistence and resumption

**📊 Monitoring & Debugging:**
- `omx hud --watch` for real-time status monitoring
- `omx doctor` for installation verification
- `omx explore` for read-only repository lookup
- `omx sparkshell` for shell-native inspection

**🔧 Project State Management:**
- `.omx/` directory stores plans, logs, memory, and mode tracking
- Scoped AGENTS.md for project-specific guidance
- Consistent workflow from clarification to completion

### Quick Start

```bash
# Install prerequisites
npm install -g @openai/codex oh-my-codex

# Initial setup (installs prompts, skills, config, AGENTS scaffolding)
omx setup

# Launch with recommended settings
omx --madmax --high

# Then work normally inside Codex with the canonical workflow
$deep-interview "clarify your task"
$ralplan "approve the plan"
$ralph "execute to completion"
```

### Platform Requirements

**Prerequisites:**
- Node.js 20+
- Codex CLI installed and authenticated
- tmux on macOS/Linux (for team runtime)
- psmux on native Windows (for team runtime)

**tmux Installation:**

| Platform | Command |
|----------|---------|
| macOS | `brew install tmux` |
| Ubuntu/Debian | `sudo apt install tmux` |
| Fedora | `sudo dnf install tmux` |
| Arch | `sudo pacman -S tmux` |
| Windows | `winget install psmux` |
| Windows (WSL2) | `sudo apt install tmux` |

### Built With

- **TypeScript** - Type-safe JavaScript
- **Node.js** - Runtime environment
- **OpenAI Codex CLI** - Core agent engine
- **tmux/psmux** - Terminal multiplexer for team runtime

### Why It Stands Out

**🔄 Structured Workflow:**
- Consistent approach from clarification to completion
- Built-in review and approval steps with `$ralplan`
- Clear separation between planning and execution

**👥 Agent Coordination:**
- Specialist roles for different task types
- Parallel execution with `$team` for big projects
- Persistent completion loop with `$ralph`

**📁 State Persistence:**
- All plans, logs, and state stored in `.omx/`
- Team sessions can be resumed after interruption
- Project memory carries forward between sessions

**🎛️ Monitoring:**
- Real-time HUD for tracking agent activity
- Debug tools for troubleshooting
- Status commands for team management

### When to Use OMX

**Use OMX if:**
- You already like Codex and want a better day-to-day runtime
- You need structured workflows for complex tasks
- You want specialist agent roles and reusable skills
- You need coordinated parallel execution for big projects

**Skip OMX if:**
- You want plain Codex with no extra workflow layer
- Your tasks are simple and don't need coordination
- You prefer to build your own workflow from scratch

### Tips & Gotchas

**macOS Intel Performance:**
On some Intel Macs, OMX startup (especially with `--madmax --high`) can spike syspolicyd/trustd CPU usage due to Gatekeeper validation. Solutions:

```bash
# Remove quarantine attribute
xattr -dr com.apple.quarantine $(which omx)

# Or add terminal to Developer Tools allowlist in macOS Security settings

# Or use lower concurrency (avoid --madmax --high)
```

**Team Runtime:**
Use the team runtime (`$team`) only when you specifically need durable tmux/worktree coordination — not as the default way to begin using OMX.

### Repository & Resources

- [Yeachan-Heo/oh-my-codex](https://github.com/Yeachan-Heo/oh-my-codex)
- [Official Website](https://yeachan-heo.github.io/oh-my-codex-website/)
- [Getting Started Guide](https://github.com/Yeachan-Heo/oh-my-codex/blob/main/docs/getting-started.html)
- [Demo Guide](https://github.com/Yeachan-Heo/oh-my-codex/blob/main/DEMO.md)
- [Agent Catalog](https://github.com/Yeachan-Heo/oh-my-codex/blob/main/docs/agents.html)
- [Skills Reference](https://github.com/Yeachan-Heo/oh-my-codex/blob/main/docs/skills.html)
- [OpenClaw Integration](https://github.com/Yeachan-Heo/oh-my-codex/blob/main/docs/openclaw-integration.md)
- [Discord Community](https://discord.gg/PUwSMR9XNk)

---

*Posted from GitHub Trending - Workflow Layer for OpenAI Codex CLI*
