---
layout: post
title: "Open SWE - Open-Source Asynchronous Coding Agent from LangChain"
date: 2026-03-20
categories: [AI, Developer Tools, Coding Agents]
tags: [open-swe, langchain, langgraph, coding-agent, automation, slack, linear, github]
---

## 🔥 Open SWE

**Open SWE** is an open-source asynchronous coding agent framework from LangChain that brings enterprise-grade AI coding automation to your organization. Built on [LangGraph](https://langchain-ai.github.io/langgraph/) and [Deep Agents](https://github.com/langchain-ai/deepagents), it's the open-source version of the internal coding agents that companies like Stripe, Ramp, and Coinbase have built for their engineering teams. Currently trending #2 on GitHub with over 7,000 stars and 965 stars today.

### What It Is

Open SWE solves a key challenge in AI coding: **integrating agents into existing workflows safely**. Instead of running AI tools locally on your machine, Open SWE deploys agents in isolated cloud sandboxes that can be triggered from Slack, Linear, or GitHub — meeting engineers where they already work.

```
Linear Issue → @openswe mention → Cloud Sandbox → Agent Works → Draft PR → GitHub
Slack Thread → @openswe mention → Cloud Sandbox → Agent Works → Draft PR → GitHub
```

### What Makes It Different

| Feature | Why It Matters |
|---------|----------------|
| **Cloud Sandboxes** | Each task runs in an isolated Linux environment — full permissions, zero blast radius |
| **Multiple Triggers** | Invoke from Slack threads, Linear issues, or GitHub PR comments |
| **Persistent Sessions** | Follow-up messages route to the same running agent — no context loss |
| **Subagent Orchestration** | Main agent can spawn child agents for parallel subtasks |
| **Automatic PRs** | Agent commits changes and opens draft PRs linked back to your ticket |
| **Middleware Hooks** | Deterministic safety nets ensure critical steps happen regardless of LLM behavior |

### How It Works

**1. Sandbox Isolation**

Every task runs in its own cloud sandbox — a remote Linux environment with full shell access. The repo is cloned in, the agent gets full permissions, and any mistakes are fully contained:

- Sandboxes are reused across follow-up messages in the same thread
- Auto-recreate if they become unreachable
- Multiple tasks run in parallel — each in its own isolated sandbox

Supported providers: [Modal](https://modal.com/), [Daytona](https://www.daytona.io/), [Runloop](https://www.runloop.ai/), and [LangSmith](https://smith.langchain.com/).

**2. Curated Toolset**

Following Stripe's insight that tool curation matters more than quantity, Open SWE ships with a focused set of tools:

| Tool | Purpose |
|------|---------|
| `execute` | Shell commands in the sandbox |
| `fetch_url` | Fetch web pages as markdown |
| `http_request` | API calls (GET, POST, etc.) |
| `commit_and_open_pr` | Git commit + open GitHub draft PR |
| `linear_comment` | Post updates to Linear tickets |
| `slack_thread_reply` | Reply in Slack threads |

Plus built-in Deep Agents tools: `read_file`, `write_file`, `edit_file`, `ls`, `glob`, `grep`, `write_todos`, and `task` (subagent spawning).

**3. Context Injection**

Open SWE gathers context from two sources:

- **AGENTS.md** — If your repo contains an `AGENTS.md` at the root, it's injected into the system prompt. This encodes conventions, testing requirements, and architectural decisions (similar to Stripe's rule files).
- **Issue/Thread Context** — The full Linear issue or Slack thread history is assembled and passed to the agent, so it starts with rich context.

**4. Middleware Safety Nets**

Deterministic middleware hooks run around the agent loop:

- `check_message_queue_before_model` — Injects follow-up messages (Linear comments or Slack messages that arrive mid-run) before the next model call
- `open_pr_if_needed` — After-agent safety net that commits and opens a PR if the agent didn't do it itself
- `ToolErrorMiddleware` — Catches and handles tool errors gracefully

### Invocation Patterns

**Slack:** Mention the bot in any thread. Supports `repo:owner/name` syntax to specify which repo to work on. The agent replies in-thread with status updates and PR links.

**Linear:** Comment `@openswe` on any issue. The agent reads the full issue context, reacts with 👀 to acknowledge, and posts results back as comments.

**GitHub:** Tag `@openswe` in PR comments on agent-created PRs to have it address review feedback and push fixes to the same branch.

Each invocation creates a deterministic thread ID, so follow-up messages on the same issue or thread route to the same running agent.

### Example Workflow

```
1. Create Linear issue: "Fix authentication bug in login flow"
2. Comment: @openswe please fix this
3. Agent reacts with 👀 and starts working
4. Agent spawns in cloud sandbox, clones repo
5. Reads AGENTS.md for conventions
6. Explores codebase, identifies the bug
7. Makes fixes, runs linters/tests
8. Commits and opens draft PR
9. Posts PR link back to Linear issue
```

### Architecture Comparison

| Decision | Open SWE | Stripe (Minions) | Ramp (Inspect) | Coinbase (Cloudbot) |
|----------|----------|------------------|----------------|---------------------|
| Harness | Composed (Deep Agents/LangGraph) | Forked (Goose) | Composed (OpenCode) | Built from scratch |
| Sandbox | Pluggable (Modal, Daytona, Runloop) | AWS EC2 devboxes | Modal containers | In-house |
| Tools | ~15, curated | ~500, curated per-agent | OpenCode SDK + extensions | MCPs + custom Skills |
| Context | AGENTS.md + issue/thread | Rule files + pre-hydration | OpenCode built-in | Linear-first + MCPs |
| Orchestration | Subagents + middleware | Blueprints (deterministic + agentic) | Sessions + child sessions | Three modes |
| Invocation | Slack, Linear, GitHub | Slack + embedded buttons | Slack + web + Chrome extension | Slack-native |
| Validation | Prompt-driven + PR safety net | 3-layer (local + CI + 1 retry) | Visual DOM verification | Agent councils + auto-merge |

### Installation

Full setup requires creating a GitHub App and configuring triggers. See the comprehensive guides:

- [Installation Guide](https://github.com/langchain-ai/open-swe/blob/main/INSTALLATION.md) — GitHub App creation, LangSmith, Linear/Slack/GitHub triggers, production deployment
- [Customization Guide](https://github.com/langchain-ai/open-swe/blob/main/CUSTOMIZATION.md) — Swap sandbox, model, tools, triggers, system prompt, and middleware for your org

### Why It Matters

Open SWE represents a maturation of AI coding tools — moving from individual developer utilities to **organizational infrastructure**. The key insights:

1. **Meet engineers where they work** — Slack and Linear are where engineering coordination happens
2. **Isolate first, then trust** — Cloud sandboxes enable full permissions without production risk
3. **Deterministic safety nets** — Middleware ensures critical steps happen regardless of LLM behavior
4. **Persistent context** — Follow-up messages route to the same agent session
5. **Composable architecture** — Build on Deep Agents/LangGraph, not from scratch

### Behind the Project

Open SWE is built by the [LangChain](https://langchain-ai.github.io/) team, creators of LangGraph and the Deep Agents framework. The project is actively maintained and designed for enterprise customization.

### Requirements

- GitHub App (for OAuth and PR creation)
- Cloud sandbox provider (Modal, Daytona, Runloop, or LangSmith)
- Linear and/or Slack integration (optional, for triggers)
- LangSmith account (optional, for tracing)

### Repository

- **GitHub:** [langchain-ai/open-swe](https://github.com/langchain-ai/open-swe)
- **Stars:** 7,012+ (trending #2 today, 965 stars today)
- **Language:** Python
- **License:** MIT

---

_Open SWE brings enterprise-grade AI coding automation to any organization — isolated, safe, and integrated into your existing workflows._
