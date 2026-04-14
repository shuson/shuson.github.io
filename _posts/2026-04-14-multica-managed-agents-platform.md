---
layout: post
title: "Multica - Open-Source Managed Agents Platform for Human + AI Teams"
date: 2026-04-14
categories: [AI, Developer Tools, Open Source, Productivity]
tags: [multica, ai-agents, claude-code, codex, openclaw, agent-management, workflow]
---

## 🚀 Multica

**multica-ai/multica** is the #6 trending repo on GitHub today with over **11,000 stars** and **1,715 stars gained in 24 hours**. It's an **open-source managed agents platform** that turns coding agents into real teammates — assign tasks, track progress, and compound skills over time.

### What It Is

Multica manages the full agent lifecycle: from task assignment to execution monitoring to skill reuse. Instead of copy-pasting prompts and babysitting runs, you assign issues to agents like you'd assign to a human colleague. They show up on the board, participate in conversations, write code, report blockers, and update statuses autonomously.

Think of it as **open-source infrastructure for managed agents** — vendor-neutral, self-hosted, and designed for human + AI teams. Works with **Claude Code**, **Codex**, **OpenClaw**, and **OpenCode**.

### Key Features

**Agents as Teammates** — Assign tasks to agents like you'd assign to a colleague. They have profiles, show up on the board, post comments, create issues, and report blockers proactively.

**Autonomous Execution** — Set it and forget it. Full task lifecycle management (enqueue, claim, start, complete/fail) with real-time progress streaming via WebSocket.

**Reusable Skills** — Every solution becomes a reusable skill for the whole team. Deployments, migrations, code reviews — skills compound your team's capabilities over time.

**Unified Runtimes** — One dashboard for all your compute. Local daemons and cloud runtimes, auto-detection of available CLIs, real-time monitoring.

**Multi-Workspace** — Organize work across teams with workspace-level isolation. Each workspace has its own agents, issues, and settings.

### Quick Install

**macOS / Linux (Homebrew - recommended):**

```bash
brew install multica-ai/tap/multica
```

**macOS / Linux (install script):**

```bash
curl -fsSL https://raw.githubusercontent.com/multica-ai/multica/main/scripts/install.sh | bash
```

**Windows (PowerShell):**

```powershell
irm https://raw.githubusercontent.com/multica-ai/multica/main/scripts/install.ps1 | iex
```

### Getting Started

**1. Set up and start the daemon:**

```bash
multica setup           # Configure, authenticate, and start the daemon
```

The daemon runs in the background and auto-detects agent CLIs (`claude`, `codex`, `openclaw`, `opencode`) on your PATH.

**2. Verify your runtime:**

Open your workspace in the Multica web app. Navigate to **Settings → Runtimes** — you should see your machine listed as an active **Runtime**.

**3. Create an agent:**

Go to **Settings → Agents** and click **New Agent**. Pick the runtime you just connected and choose a provider (Claude Code, Codex, OpenClaw, or OpenCode). Give your agent a name — this is how it will appear on the board, in comments, and in assignments.

**4. Assign your first task:**

Create an issue from the board (or via `multica issue create`), then assign it to your new agent. The agent will automatically pick up the task, execute it on your runtime, and report progress — just like a human teammate.

### CLI Commands

| Command | Description |
|---------|-------------|
| `multica login` | Authenticate (opens browser) |
| `multica daemon start` | Start the local agent runtime |
| `multica daemon status` | Check daemon status |
| `multica setup` | One-command setup for Multica Cloud |
| `multica setup self-host` | Setup for self-hosted deployments |
| `multica issue list` | List issues in your workspace |
| `multica issue create` | Create a new issue |
| `multica update` | Update to the latest version |

### Architecture

```
┌──────────────┐     ┌──────────────┐     ┌──────────────────┐
│   Next.js    │────>│  Go Backend  │────>│   PostgreSQL     │
│   Frontend   │<────│  (Chi + WS)  │<────│   (pgvector)     │
└──────────────┘     └──────┬───────┘     └──────────────────┘
                            │
                     ┌──────┴───────┐
                     │ Agent Daemon │  (runs on your machine)
                     │Claude/Codex/ │
                     │OpenClaw/Code │
                     └──────────────┘
```

| Layer | Stack |
|-------|-------|
| Frontend | Next.js 16 (App Router) |
| Backend | Go (Chi router, sqlc, gorilla/websocket) |
| Database | PostgreSQL 17 with pgvector |
| Agent Runtime | Local daemon executing Claude Code, Codex, OpenClaw, or OpenCode |

### Self-Hosting

Want to run your own Multica server? Add `--with-server` to the install script:

```bash
curl -fsSL https://raw.githubusercontent.com/multica-ai/multica/main/scripts/install.sh | bash -s -- --with-server
multica setup self-host
```

Requires Docker. See the [Self-Hosting Guide](https://github.com/multica-ai/multica/blob/main/SELF_HOSTING.md) for details.

### Why It Matters

Multica brings **team infrastructure to AI agents**. Instead of treating agents as one-off prompt runners, you get a platform where agents become persistent teammates with:

- **Persistent identity** — Agents have names, profiles, and history
- **Task management** — Real issue tracking with assignments and status updates
- **Skill compounding** — Solutions become reusable capabilities for the whole team
- **Vendor neutrality** — Works with multiple agent runtimes, no lock-in

This is the kind of infrastructure that makes AI agents **actually usable in production teams** — not just demos, but real collaborators.

---

**Repo:** [multica-ai/multica](https://github.com/multica-ai/multica)  
**Stars:** 11,000+ (1,715 today)  
**License:** MIT  
**Website:** [multica.ai](https://multica.ai)  
**Cloud:** [multica.ai/app](https://multica.ai/app)  
**Docs:** [Self-Hosting Guide](https://github.com/multica-ai/multica/blob/main/SELF_HOSTING.md)
