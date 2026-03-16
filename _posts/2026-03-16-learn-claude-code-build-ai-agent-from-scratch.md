---
layout: post
title: "Learn Claude Code - Build an AI Coding Agent from Scratch"
date: 2026-03-16
categories: [AI, Agent Framework, Education]
tags: [learn-claude-code, ai-agents, claude-code, agent-loop, tool-use, subagents, education, shareai-lab]
---

## 🔥 Learn Claude Code

**Learn Claude Code** is a progressive learning project that teaches you how to build a nano Claude Code-like agent from scratch. Through 12 carefully designed sessions, you'll understand every mechanism that powers modern AI coding agents.

### What It Is

This isn't just another agent framework — it's a **0→1 educational journey** that deconstructs the agent pattern step by step:

```
messages[] --> LLM --> response
  |
  stop_reason == "tool_use"?
   / \
  yes no
  |   |
  execute tools  return text
  append results
  loop back -----------------> messages[]
```

That's the minimal loop. Every AI coding agent needs this. Learn Claude Code shows you exactly how to build it, then layer on production mechanisms without changing the core loop.

### The 12 Sessions

Each session adds one mechanism with a clear motto:

| Session | Topic | Motto |
|---------|-------|-------|
| s01 | The Agent Loop | One loop & Bash is all you need |
| s02 | Tool Use | Adding a tool means adding one handler |
| s03 | TodoWrite | An agent without a plan drifts |
| s04 | Subagents | Break big tasks down; each subtask gets a clean context |
| s05 | Skills | Load knowledge when you need it, not upfront |
| s06 | Context Compact | Context will fill up; you need a way to make room |
| s07 | Tasks | Break big goals into small tasks, order them, persist to disk |
| s08 | Background Tasks | Run slow operations in the background; the agent keeps thinking |
| s09 | Agent Teams | When the task is too big for one, delegate to teammates |
| s10 | Team Protocols | Teammates need shared communication rules |
| s11 | Autonomous Agents | Teammates scan the board and claim tasks themselves |
| s12 | Worktree + Task Isolation | Each works in its own directory, no interference |

### Why It Matters

Understanding agent internals is crucial for:

1. **Building better agents** — Know what's happening under the hood
2. **Debugging effectively** — Understand why agents fail and how to fix them
3. **Extending capabilities** — Add custom tools, skills, and behaviors
4. **Optimizing costs** — Learn context compression and efficient token usage
5. **Teaching others** — Mental-model-first documentation in 3 languages

### Architecture

The project is organized for progressive learning:

```
learn-claude-code/
├── agents/           # Python reference implementations (s01-s12 + s_full)
├── docs/{en,zh,ja}/  # Mental-model-first documentation (3 languages)
├── web/              # Interactive learning platform (Next.js)
├── skills/           # Skill files for s05
└── .github/workflows/ci.yml
```

### Quick Start

```bash
git clone https://github.com/shareAI-lab/learn-claude-code
cd learn-claude-code
pip install -r requirements.txt
cp .env.example .env  # Edit with your ANTHROPIC_API_KEY

# Start with the basics
python agents/s01_agent_loop.py

# Or jump to the full implementation
python agents/s12_worktree_task_isolation.py
python agents/s_full.py  # Capstone: all mechanisms combined
```

### Interactive Learning

The project includes a Next.js-based interactive platform with visualizations, step-through diagrams, and source viewer:

```bash
cd web && npm install && npm run dev
# Visit http://localhost:3000
```

### Beyond the Basics

After mastering the 12 sessions, you'll understand how to build production agents. The repo also points to related projects:

- **Kode CLI** — Production-ready CLI with skill & LSP support
- **Kode Agent SDK** — Standalone library embeddable in backends and browser extensions
- **claw0** — Companion teaching repo showing how to turn a disposable agent into an always-on personal AI assistant with heartbeat, cron, IM channels, memory, and soul personality

### Key Insights

The project teaches several crucial mental models:

1. **The Agent Loop is Simple** — A while loop + tool handling is all you need
2. **Layer Mechanisms Carefully** — Each addition should not break the core loop
3. **Context Management is Critical** — Three-layer compression enables infinite sessions
4. **Isolation Enables Scale** — Worktree isolation lets multiple agents work without interference
5. **Communication Protocols Matter** — JSONL mailboxes enable team coordination

### Who Should Use This

- **Developers** learning to build AI agents
- **Teams** wanting to understand agent internals before using production tools
- **Educators** teaching AI agent architecture
- **Curious engineers** who want to know "how does Claude Code actually work?"

### Repository

- **GitHub:** [shareAI-lab/learn-claude-code](https://github.com/shareAI-lab/learn-claude-code)
- **Stars:** 27,852+ (trending #4 today)
- **Language:** TypeScript/Python
- **License:** MIT

---

_The model is the agent. Our job is to give it tools and stay out of the way._
