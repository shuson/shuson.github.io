---
layout: post
title: "Obra Superpowers - Agentic Skills Framework for Coding Agents"
date: 2026-03-18
categories: [AI, Developer Tools, Agent Framework]
tags: [superpowers, obra, claude-code, agent-skills, tdd, subagents, coding-agents, jesse-vincent]
---

## 🔥 Obra Superpowers

**Superpowers** is a complete software development workflow for coding agents, built on top of composable "skills" that transform how AI agents approach software development. Created by Jesse Vincent (of `fsck.com` fame), it's currently the #1 trending repository on GitHub with over 92K stars.

### What It Is

Superpowers doesn't just let your coding agent write code — it gives your agent a **methodology**. Instead of jumping straight into implementation, agents equipped with Superpowers:

1. **Ask clarifying questions** to understand what you're really trying to build
2. **Present design specs** in digestible chunks for your approval
3. **Create detailed implementation plans** with bite-sized tasks (2-5 minutes each)
4. **Execute via subagent-driven development** with two-stage review (spec compliance → code quality)
5. **Enforce TDD** with strict RED-GREEN-REFACTOR cycles
6. **Request code reviews** between tasks before proceeding

The result? Agents that can work autonomously for hours without deviating from the plan.

### How It Works

Superpowers operates as a plugin for your favorite coding agent (Claude Code, Cursor, Codex, OpenCode, Gemini). Once installed, skills trigger automatically based on context:

```
You: "Help me build a feature"
  ↓
Agent: brainstorming skill → Refines requirements through questions
  ↓
Agent: Presents design spec → You review and approve
  ↓
Agent: writing-plans skill → Breaks into tasks with exact file paths & code
  ↓
Agent: subagent-driven-development → Dispatches fresh subagent per task
  ↓
Each subagent: test-driven-development → RED-GREEN-REFACTOR cycle
  ↓
Agent: requesting-code-review → Reviews against plan before merging
  ↓
Agent: finishing-a-development-branch → Cleanup and merge options
```

### Key Skills

| Skill | Trigger | What It Does |
|-------|---------|--------------|
| `brainstorming` | Before coding | Socratic design refinement, explores alternatives |
| `using-git-worktrees` | After design approval | Creates isolated workspace on new branch |
| `writing-plans` | With approved design | Breaks work into 2-5 minute tasks with exact code |
| `subagent-driven-development` | With plan | Dispatches subagents per task with two-stage review |
| `test-driven-development` | During implementation | Enforces RED-GREEN-REFACTOR, deletes pre-test code |
| `requesting-code-review` | Between tasks | Reviews against plan, blocks on critical issues |
| `finishing-a-development-branch` | Task completion | Verifies tests, presents merge/PR options |
| `systematic-debugging` | Debugging | 4-phase root cause process with defense-in-depth |

### Core Principles

Superpowers enforces several non-negotiable principles:

- **Test-Driven Development** — Write tests first, always. No exceptions.
- **Systematic over ad-hoc** — Process over guessing, evidence over claims
- **Complexity reduction** — Simplicity as the primary goal (YAGNI, DRY)
- **Verification before completion** — Ensure it's actually fixed before moving on

### Installation

**Claude Code:**
```bash
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

**Cursor:**
```bash
/add-plugin superpowers
# Or search "superpowers" in the plugin marketplace
```

**Codex:**
```bash
# Tell Codex to fetch installation instructions
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.codex/INSTALL.md
```

**OpenCode:**
```bash
# Tell OpenCode to fetch installation instructions
Fetch and follow instructions from https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.opencode/INSTALL.md
```

**Gemini:**
```bash
gemini extensions install https://github.com/obra/superpowers
gemini extensions update superpowers  # To update
```

### Why It Matters

Most AI coding agents suffer from the same problems:

1. **Context drift** — Agents lose track of the original goal
2. **Premature implementation** — Jumping to code before understanding the problem
3. **No testing discipline** — Writing code without tests leads to fragile systems
4. **No review process** — No checkpoint to catch deviations from intent

Superpowers addresses all of these by encoding **software development best practices** directly into the agent's workflow. The skills aren't suggestions — they're mandatory workflows that trigger automatically.

### The Secret Sauce

What makes Superpowers different from other agent frameworks:

- **Automatic skill triggering** — No need to manually invoke skills; they activate based on context
- **Two-stage review** — Subagents are reviewed for spec compliance first, then code quality
- **Bite-sized tasks** — Plans break work into 2-5 minute chunks, reducing error surface
- **Git worktree isolation** — Each development branch is isolated, preventing interference
- **TDD enforcement** — The agent literally deletes code written before tests

### Behind the Project

Superpowers is built by **Jesse Vincent**, a well-known figure in the Perl and open-source community (creator of `rt.cpan.org`, `fsck.com`, and numerous other tools). The project is developed at **Prime Radiant** and is available under the MIT License.

### Repository

- **GitHub:** [obra/superpowers](https://github.com/obra/superpowers)
- **Stars:** 92,224+ (trending #1 today, 3,078 stars today)
- **Language:** Shell (skills are markdown-based)
- **License:** MIT
- **Community:** [Discord](https://discord.gg/Jd8Vphy9jq)
- **Blog:** [Superpowers for Claude Code](https://blog.fsck.com/2025/10/09/superpowers/)

---

_Your coding agent just got Superpowers. The question is: what will you build with them?_
