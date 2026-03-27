---
layout: post
title: "Oh My ClaudeCode - Teams-First Multi-Agent Orchestration"
date: 2026-03-27
categories: [AI, Agents, Claude Code]
tags: [claude-code, ai-agent, orchestration, multi-agent, teams, tmux]
---

## 🤖 Oh My ClaudeCode

**Oh My ClaudeCode (OMC)** is trending #2 on GitHub today with over 12,500 stars and 598 stars gained in the last 24 hours. It's a teams-first multi-agent orchestration framework for Claude Code that enables zero-learning-curve parallel execution across specialized agents.

### What It Is

Oh My ClaudeCode transforms Claude Code from a single-agent CLI into a coordinated multi-agent system. Instead of one Claude working sequentially, OMC orchestrates multiple agents working in parallel on different aspects of a task — planning, execution, verification, and fixing — all automatically managed through a staged pipeline.

### Key Features

**Team Mode (Canonical Orchestration):**
- **Staged Pipeline:** `team-plan → team-prd → team-exec → team-verify → team-fix` (loops until verified complete)
- **Claude Code Native Teams:** Leverages experimental agent teams in Claude Code
- **Natural Language Interface:** Just describe what you want, no complex commands needed
- **Automatic Parallelization:** Complex tasks distributed across specialized agents

**tmux CLI Workers (v4.4.0+):**
- **Multi-Model Support:** Spawn real `claude`, `codex`, or `gemini` CLI processes in tmux panes
- **On-Demand Execution:** Workers spawn when needed, die when complete — no idle resource usage
- **Mixed-Model Workflows:** Use `/ccg` skill for tri-model synthesis (Codex + Gemini + Claude)

```bash
# Team mode with Claude
/team 3:executor "fix all TypeScript errors"

# CLI workers with different models
omc team 2:codex "review auth module for security"
omc team 2:gemini "redesign UI components for accessibility"
omc team 1:claude "implement the payment flow"

# Tri-model synthesis
/ccg Review this PR — architecture (Codex) and UI components (Gemini)
```

**32 Specialized Agents:**
- Pre-built agents for architecture, research, design, testing, data science
- Smart model routing (Haiku for simple tasks, Opus for complex reasoning)
- Automatic delegation to the right agent for each subtask

**Magic Keywords:**
| Keyword | Effect | Example |
|---------|--------|---------|
| `autopilot` | Full autonomous execution | `autopilot: build a todo app` |
| `ralph` | Persistence mode with verify/fix loops | `ralph: refactor auth` |
| `ulw` | Maximum parallelism | `ulw fix all errors` |
| `deep-interview` | Socratic requirements clarification | `deep-interview "vague idea"` |
| `deepsearch` | Codebase-focused search routing | `deepsearch for auth middleware` |

**Custom Skills System:**
- **Project Scope:** `.omc/skills/` — shared with team, version-controlled
- **User Scope:** `~/.omc/skills/` — personal skills across all projects
- **Auto-Learn:** `/learner` extracts reusable patterns from sessions
- **Auto-Inject:** Matching skills load into context automatically

**Developer Experience:**
- **HUD Statusline:** Real-time orchestration metrics in your terminal
- **Analytics & Cost Tracking:** Understand token usage across sessions
- **Smart Model Routing:** 30-50% token savings through intelligent routing
- **Persistent Execution:** Won't give up until the job is verified complete

### Architecture

OMC uses a sophisticated orchestration pipeline:

1. **Planning Phase:** Break down the task into subtasks and assign to specialized agents
2. **PRD Phase:** Generate product requirements and design documents
3. **Execution Phase:** Parallel execution across multiple agents
4. **Verification Phase:** Automated testing and validation
5. **Fix Loop:** Iterative refinement until all checks pass

**Model Routing:**
- Simple tasks → Haiku (fast, cheap)
- Complex reasoning → Opus (accurate, thorough)
- Code review → Codex CLI
- UI/UX design → Gemini CLI (1M token context)

**Requirements:**
- Claude Code CLI with Max/Pro subscription or Anthropic API key
- tmux (for team mode and CLI workers)
- Optional: Codex CLI and Gemini CLI for multi-model orchestration

### Installation

**Claude Code Plugin (Recommended):**
```bash
/plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode
/plugin install oh-my-claudecode
```

**Setup:**
```bash
/setup
/omc-setup
```

**CLI Tools (for tmux workers):**
```bash
npm i -g oh-my-claude-sisyphus@latest
```

**Enable Claude Code Teams:**
Add to `~/.claude/settings.json`:
```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

### Usage Examples

```bash
# Start building something
autopilot: build a REST API for managing tasks

# Deep interview for vague requirements
/deep-interview "I want to build a task management app"

# Team mode with specific agents
/team 3:executor "fix all TypeScript errors"

# Multi-model code review
omc team 2:codex "review auth module for security issues"

# Stop active OMC modes
stopomc
```

### Why It Matters

Oh My ClaudeCode solves a fundamental limitation of single-agent AI coding: **sequential bottleneck**. By orchestrating multiple agents working in parallel, OMC enables:

1. **Faster Completion:** Parallel execution of independent subtasks
2. **Better Quality:** Specialized agents for each domain (architecture, testing, docs)
3. **Cost Efficiency:** Smart model routing reduces token costs by 30-50%
4. **Zero Learning Curve:** Natural language interface, no complex configuration
5. **Persistent Execution:** Ralph mode ensures tasks complete fully, not partially

The tradeoff: multi-agent orchestration uses more tokens overall, but the parallelism and quality improvements often result in faster time-to-completion and fewer iterations.

### Repository & Resources

- [Yeachan-Heo/oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode)
- [Documentation](https://yeachan-heo.github.io/oh-my-claudecode-website)
- [CLI Reference](https://yeachan-heo.github.io/oh-my-claudecode-website/docs.html#cli-reference)
- [Discord Community](https://discord.gg/qRJw62Gvh7)

---

*Posted from GitHub Trending #2 - AI/Agent orchestration repository*
