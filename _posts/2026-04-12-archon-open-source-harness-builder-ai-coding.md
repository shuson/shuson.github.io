---
layout: post
title: "Archon - Open-Source Harness Builder for Deterministic AI Coding"
date: 2026-04-12
categories: [AI, Developer Tools, Open Source]
tags: [archon, ai-coding, workflow-engine, claude-code, automation, open-source]
---

## 🚀 Archon

**coleam00/Archon** is the #3 trending repo on GitHub today with over **16,453 stars** and **1,346 stars gained in 24 hours**. It's the first open-source harness builder for AI coding agents, making AI development workflows deterministic and repeatable.

### What It Is

Archon is a **workflow engine for AI coding agents**. Think of it as Dockerfiles for infrastructure or GitHub Actions for CI/CD — but for AI coding workflows. You define your development process as YAML workflows (planning, implementation, validation, code review, PR creation), and Archon executes them reliably across all your projects.

The core problem it solves: when you ask an AI agent to "fix this bug", the output depends on the model's mood. It might skip planning, forget tests, or write a poor PR description. Archon fixes this by encoding your development process as a deterministic workflow where the AI fills in the intelligence at each step.

### Key Features

**Repeatable** — Same workflow, same sequence, every time. Plan → Implement → Validate → Review → PR.

**Isolated** — Every workflow run gets its own git worktree. Run 5 fixes in parallel with no conflicts.

**Fire and Forget** — Kick off a workflow, go do other work. Come back to a finished PR with review comments.

**Composable** — Mix deterministic nodes (bash scripts, tests, git ops) with AI nodes (planning, code generation, review). The AI only runs where it adds value.

**Portable** — Define workflows once in `.archon/workflows/`, commit them to your repo. They work the same from CLI, Web UI, Slack, Telegram, or GitHub.

### Example Workflow

```yaml
# .archon/workflows/build-feature.yaml
nodes:
  - id: plan
    prompt: "Explore the codebase and create an implementation plan"

  - id: implement
    depends_on: [plan]
    loop:  # AI loop - iterate until done
      prompt: "Read the plan. Implement the next task. Run validation."
      until: ALL_TASKS_COMPLETE
      fresh_context: true

  - id: run-tests
    depends_on: [implement]
    bash: "bun run validate"  # Deterministic - no AI

  - id: review
    depends_on: [review]
    prompt: "Review all changes against the plan. Fix any issues."

  - id: approve
    depends_on: [review]
    loop:
      prompt: "Present the changes for review. Address any Feedback."
      until: APPROVED
      interactive: true  # Pauses for human input

  - id: create-pr
    depends_on: [approve]
    prompt: "Push changes and create a pull request"
```

### Quick Start

```bash
# Install via Homebrew (macOS)
brew install coleam00/archon/archon

# Or curl install (macOS/Linux)
curl -fsSL https://archon.diy/install | bash

# Windows (PowerShell)
irm https://archon.diy/install.ps1 | iex

# Then in your project
cd /path/to/your/project
claude
# Say: "Use archon to fix issue #42"
```

### Prerequisites

- **Bun** — [bun.sh](https://bun.sh)
- **Claude Code** — [claude.ai/code](https://claude.ai/code)
- **GitHub CLI** — [cli.github.com](https://cli.github.com/)

### Built-in Workflows

Archon ships with 17 default workflows:

| Workflow | Purpose |
|----------|---------|
| `archon-assist` | General Q&A, debugging, exploration |
| `archon-fix-github-issue` | Full issue-to-PR pipeline with review |
| `archon-idea-to-pr` | Feature idea → plan → implement → PR |
| `archon-smart-pr-review` | Multi-agent PR review with auto-fixes |
| `archon-resolve-conflicts` | Detect and resolve merge conflicts |
| `archon-architect` | Architectural sweeps and codebase health |
| `archon-refactor-safely` | Safe refactoring with type-check hooks |

You can also author custom workflows in YAML and commands in Markdown — commit them to your repo and your whole team runs the same process.

### Web Dashboard

Archon includes a web dashboard for:

- **Chat** — Conversation interface with real-time streaming
- **Dashboard** — Monitor running workflows, filter by project/status
- **Workflow Builder** — Visual drag-and-drop editor for DAG workflows
- **Workflow Execution** — Step-by-step progress view

Everything syncs across platforms — CLI, Web UI, Slack, Telegram, GitHub — all in one place.

### Platform Adapters

Connect your preferred chat platform for remote access:

- **Telegram** — 5 min setup
- **Slack** — 15 min setup
- **Discord** — 5 min setup
- **GitHub Webhooks** — 15 min setup

### Why It Matters

Archon brings **engineering rigor to AI coding**. Instead of hoping the AI gets it right, you encode your best practices as workflows. The result:

- Consistent output quality
- Audit trails for every change
- Team-wide standardization
- Human oversight at the right gates

It's essentially **n8n for software development** — but purpose-built for AI agents.

---

**Repo:** [coleam00/Archon](https://github.com/coleam00/Archon)  
**Stars:** 16,453+ (1,346 today)  
**License:** MIT  
**Docs:** [archon.diy](https://archon.diy)  
**Quick Start:** [Full Setup Guide](https://archon.diy/getting-started/overview/)
