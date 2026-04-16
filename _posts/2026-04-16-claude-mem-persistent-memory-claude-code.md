---
layout: post
title: "Claude-Mem - Persistent Memory for Claude Code"
date: 2026-04-16
categories: [AI, Developer Tools, Open Source, Productivity]
tags: [claude-mem, claude-code, memory, context, ai-agents, llm, productivity]
---

## 🧠 Claude-Mem

**thedotmack/claude-mem** is the #3 trending repo on GitHub today with over **57,700 stars** and **2,305 stars gained in 24 hours**. It's a **persistent memory compression system** built for Claude Code that automatically captures session context and makes it available in future sessions.

### What It Is

Claude-Mem solves a fundamental problem with AI coding assistants: **context loss between sessions**. Every time you start a new Claude Code session, you lose all the context from previous work. Claude-Mem fixes this by:

- **Automatically capturing** everything Claude does during coding sessions
- **Compressing observations** with AI to extract key insights
- **Injecting relevant context** back into future sessions

Think of it as **long-term memory for your AI coding partner** — it remembers your project structure, decisions, patterns, and progress even after sessions end.

### Key Features

**Automatic Context Capture** — No manual notes needed. Claude-Mem hooks into Claude Code's lifecycle and captures tool usage, file changes, and decisions automatically.

**AI-Powered Compression** — Raw session data is compressed using Claude itself, extracting semantic summaries that preserve meaning while minimizing token usage. Future sessions get relevant context without overwhelming the prompt.

**Progressive Disclosure** — Memory is layered by relevance. Recent and high-priority context appears first, with deeper history available on demand. You see token costs before retrieving.

**Skill-Based Search** — Query your project history with natural language:

```bash
# Search memory for past decisions
/mem-search "Why did we choose PostgreSQL over SQLite?"

# Find relevant context about authentication
/mem-search "JWT implementation notes"
```

**Web Viewer UI** — Real-time memory stream at `http://localhost:37777`. Browse observations, search history, and see what context is being injected.

**Privacy Control** — Use `<private>` tags in conversations to exclude sensitive content from storage. Fine-grained control over what gets remembered.

**Multi-IDE Support** — Works with:
- Claude Code (native)
- Gemini CLI
- OpenCode
- OpenClaw Gateway (single-command install)

**Citations & References** — Every observation gets an ID. Reference past decisions with `obs:12345` or browse the full history in the web viewer.

### Quick Install

**For Claude Code:**
```bash
npx claude-mem install
```

**For Gemini CLI:**
```bash
npx claude-mem install --ide gemini-cli
```

**For OpenClaw Gateway:**
```bash
curl -fsSL https://install.cmem.ai/openclaw.sh | bash
```

**Via Plugin Marketplace (inside Claude Code):**
```bash
/plugin marketplace add thedotmack/claude-mem
/plugin install claude-mem
```

Restart your IDE. Context from previous sessions will automatically appear.

### How It Works

| Component | Purpose |
|-----------|---------|
| **Hooks** | 7 lifecycle hooks capture session events (start, tool-use, file-change, end) |
| **Worker Service** | HTTP API + Bun runtime manages memory storage and retrieval |
| **Database** | SQLite stores observations, summaries, and metadata |
| **Compression Engine** | AI-powered summarization reduces token usage |
| **Web UI** | Real-time viewer at localhost:37777 |
| **Search Skills** | Natural language queries over project history |

### Architecture Flow

```
Claude Code Session
       ↓
[Hooks Capture Events]
       ↓
[Worker Compresses with AI]
       ↓
[SQLite Storage]
       ↓
Future Session Starts
       ↓
[Relevant Context Injected]
       ↓
Claude Continues with Memory
```

### Configuration

Fine-grained control via `~/.claude-mem/config.json`:

```json
{
  "autoInject": true,
  "maxContextTokens": 4000,
  "compressionModel": "claude-sonnet-4-20250514",
  "excludePatterns": ["*.log", "node_modules/**"],
  "privacyMode": "strict"
}
```

### Why It Matters

Claude-Mem transforms Claude Code from a **stateless coding assistant** into a **persistent collaborator** that:

- **Remembers your architecture decisions** — No more re-explaining why you chose a pattern
- **Tracks project evolution** — See how your codebase changed over weeks
- **Reduces repetition** — Claude won't ask the same questions twice
- **Preserves institutional knowledge** — Hand off projects with full context
- **Optimizes token usage** — Smart compression means more relevant context, less waste

For teams, this is huge. New developers onboard with full project history. Solo devs never lose context between sessions.

### Real-World Use Cases

**Solo Development** — Work on a feature Monday, pick up Tuesday with full context. Claude remembers what you were debugging, what approaches you tried, what worked.

**Team Collaboration** — Share memory across team members. Everyone sees the same project history, decisions, and patterns.

**Long-Running Projects** — Months into a codebase? Claude-Mem preserves the evolution. Search "why did we refactor the auth module?" and get the answer.

**AI Agent Workflows** — Building autonomous agents? Claude-Mem provides the persistent state layer they need to improve over time.

### Version & License

- **Current Version:** 6.5.0
- **License:** AGPL 3.0
- **Node Requirement:** >=18.0.0
- **Mentioned in:** [Awesome Claude Code](https://github.com/thedotmack/awesome-claude-code)

---

**Repo:** [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem)  
**Stars:** 57,700+ (2,305 today)  
**License:** AGPL 3.0  
**Docs:** [docs.claude-mem.ai](https://docs.claude-mem.ai)  
**Web UI:** `http://localhost:37777` (after install)
