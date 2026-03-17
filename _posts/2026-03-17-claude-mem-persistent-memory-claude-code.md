---
layout: post
title: "Claude-Mem - Persistent Memory for Claude Code"
date: 2026-03-17
categories: [AI, Developer Tools, Productivity]
tags: [claude-mem, claude-code, memory, context-management, ai-agents, plugin, thedotmack]
---

## 🔥 Claude-Mem

**Claude-Mem** is a persistent memory compression system built for Claude Code. It automatically captures everything Claude does during your coding sessions, compresses it with AI, and injects relevant context back into future sessions.

### What It Is

Claude-Mem solves a fundamental problem with AI coding assistants: **context loss between sessions**. When you close a Claude Code session, all the discoveries, decisions, and learnings disappear. Claude-Mem changes that by:

1. **Automatically capturing** tool usage and observations during sessions
2. **Generating semantic summaries** using AI compression
3. **Injecting relevant context** into future sessions based on what you're working on

### How It Works

The system operates transparently in the background:

```
Claude Code Session
    ↓
Tool Usage & Observations
    ↓
AI Compression (Semantic Summaries)
    ↓
Persistent Memory Store
    ↓
Future Session → Context Injection (relevant memories)
```

### Key Features

- **🧠 Persistent Memory** — Context survives across sessions and reconnects
- **📊 Progressive Disclosure** — Layered memory retrieval with token cost visibility
- **🔍 Skill-Based Search** — Query your project history with `mem-search` skill
- **🖥️ Web Viewer UI** — Real-time memory stream at http://localhost:37777
- **💻 Claude Desktop Skill** — Search memory from Claude Desktop conversations
- **🔒 Privacy Control** — Use `<private>` tags to exclude sensitive content
- **⚙️ Context Configuration** — Fine-grained control over what gets injected
- **🤖 Automatic Operation** — No manual intervention required
- **🔗 Citations** — Reference past observations with stable IDs

### Quick Start

Install directly in Claude Code:

```bash
# In a Claude Code session:
/plugin marketplace add thedotmack/claude-mem
/plugin install claude-mem

# Restart Claude Code
```

That's it. Context from previous sessions will automatically appear in new sessions.

### OpenClaw Integration

For OpenClaw Gateway users, there's a one-command installer:

```bash
curl -fsSL https://install.cmem.ai/openclaw.sh | bash
```

The installer handles dependencies, plugin setup, AI provider configuration, worker startup, and optional real-time observation feeds to Telegram, Discord, Slack, and more.

### Architecture

Claude-Mem consists of several components:

```
claude-mem/
├── mcp-server/      # MCP protocol implementation
├── worker/          # Background compression & indexing
├── web-viewer/      # Real-time memory stream UI
├── skills/          # Search & retrieval skills
└── docs/            # Documentation & integration guides
```

The system uses a **progressive disclosure** model:

1. **Session Start** — Inject high-level project summaries
2. **On-Demand** — Deep-dive into specific memories via search
3. **Full Access** — Web viewer for complete memory exploration

### Use Cases

Claude-Mem shines in scenarios where continuity matters:

1. **Long-term Projects** — Maintain context across weeks/months of development
2. **Multi-Session Workflows** — Pick up where you left off without re-explaining
3. **Team Collaboration** — Shared memory across team members (with proper access control)
4. **Learning & Onboarding** — New team members can query historical decisions
5. **Audit Trails** — Track what Claude did and why over time

### Privacy & Control

Claude-Mem respects privacy boundaries:

- **`<private>` Tags** — Wrap sensitive content to exclude from storage
- **Context Configuration** — Control which contexts get injected per-project
- **Local-First** — Memory stored locally by default (configurable)
- **Transparent Logging** — See exactly what's being captured in the web viewer

### Why It Matters

As AI agents become more capable, **memory becomes the bottleneck**. Without persistent memory:

- Every session starts from scratch
- Users must re-explain context repeatedly
- Token budgets waste on rehashing known information
- Learning compounds slowly

Claude-Mem addresses this by treating memory as a **first-class concern**, not an afterthought. The compression layer ensures token costs stay manageable while preserving semantic meaning.

### Comparison to Similar Tools

| Tool | Focus | Key Difference |
|------|-------|----------------|
| Claude-Mem | Claude Code plugin | Native integration, automatic capture |
| Mem0 | General memory layer | Broader scope, more configuration |
| LangChain Memory | Agent framework | Tied to LangChain ecosystem |
| Custom solutions | Project-specific | Require significant dev effort |

Claude-Mem's advantage is its **zero-config operation** for Claude Code users while still offering deep customization for power users.

### Repository

- **GitHub:** [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem)
- **Stars:** 36,752+ (trending #2 today, 1,045 stars today)
- **Language:** TypeScript
- **License:** AGPL 3.0
- **Docs:** [docs.claude-mem.ai](https://docs.claude-mem.ai/)

---

_Memory is what separates a tool from a collaborator._
