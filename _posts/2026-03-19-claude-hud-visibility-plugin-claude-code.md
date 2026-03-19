---
layout: post
title: "Claude HUD - Real-Time Visibility Plugin for Claude Code"
date: 2026-03-19
categories: [AI, Developer Tools, Claude Code]
tags: [claude-hud, claude-code, plugin, developer-tools, jarrod-watts, context-monitoring, agent-tracking]
---

## 🔥 Claude HUD

**Claude HUD** is a Claude Code plugin that gives you real-time visibility into what's happening during your coding sessions. It displays context usage, active tools, running subagents, and todo progress — all directly in your terminal, below your input line. Currently trending #1 on GitHub with over 6,800 stars and 1,000+ stars today.

### What It Is

Claude HUD solves a common frustration with AI coding assistants: **not knowing what's happening under the hood**. While Claude Code is working, you're left guessing — is it still thinking? What files is it reading? How much context is left?

Claude HUD answers all of these questions with a live statusline that updates every ~300ms:

```
[Opus | Max] │ my-project git:(main*)
Context █████░░░░░ 45% │ Usage ██░░░░░░░░ 25% (1h 30m / 5h)
◐ Edit: auth.ts | ✓ Read ×3 | ✓ Grep ×2
◐ explore [haiku]: Finding auth code (2m 15s)
▸ Fix authentication bug (2/5)
```

### What You See

| Feature | Why It Matters |
|---------|----------------|
| **Context bar** | Visual indicator of how full your context window is (green → yellow → red) |
| **Usage limits** | Track your Pro/Max/Team rate limit consumption in real-time |
| **Tool activity** | Watch Claude read, edit, grep, and search files as it happens |
| **Agent tracking** | See which subagents are running and what they're working on |
| **Todo progress** | Track task completion with a live progress indicator |
| **Git status** | Current branch, dirty state, and ahead/behind remote |
| **Session duration** | Know how long your session has been running |

### How It Works

Claude HUD uses Claude Code's native **statusline API** — no separate window, no tmux required, works in any terminal:

```
Claude Code → stdin JSON → claude-hud → stdout → displayed in your terminal
           ↘ transcript JSONL (tools, agents, todos)
```

Key features:
- **Native token data** from Claude Code (not estimated)
- **Scales automatically** with context window size (including 1M-context sessions)
- **Parses the transcript** for tool/agent/todo activity
- **Updates every ~300ms** for smooth real-time feedback

### Installation

**Step 1: Add the marketplace**
```bash
/plugin marketplace add jarrodwatts/claude-hud
```

**Step 2: Install the plugin**
```bash
/plugin install claude-hud
```

**⚠️ Linux users:** If you get `EXDEV: cross-device link not permitted`, set TMPDIR first:
```bash
mkdir -p ~/.cache/tmp && TMPDIR=~/.cache/tmp claude
# Then run the install command in that session
```

**Step 3: Configure the statusline**
```bash
/claude-hud:setup
```

Done! The HUD appears immediately — no restart needed.

### Configuration

Customize your HUD anytime with the guided setup:

```bash
/claude-hud:configure
```

#### Presets

| Preset | What's Shown |
|--------|--------------|
| **Full** | Everything — tools, agents, todos, git, usage, duration |
| **Essential** | Activity lines + git status, minimal clutter |
| **Minimal** | Core only — just model name and context bar |

#### Advanced Options

Edit `~/.claude/plugins/claude-hud/config.json` for fine-grained control:

- **Layout**: `expanded` (multi-line) or `compact` (single line)
- **Path depth**: Show 1-3 directory levels in project path
- **Git details**: Branch, dirty state, ahead/behind, file change counts
- **Context display**: Percentage, tokens, or remaining
- **Colors**: Customize context, usage, warning, and critical colors
- **Element order**: Reorder or hide individual HUD elements

### Example Configurations

**Minimal (single line):**
```
[Opus] │ Context █████░░░░░ 45%
```

**Essential (2 lines):**
```
[Opus | Max] │ my-project git:(main*)
Context █████░░░░░ 45% │ Usage ██░░░░░░░░ 25% (1h 30m / 5h)
```

**Full (with activity):**
```
[Opus | Max] │ my-project git:(main*)
Context █████░░░░░ 45% │ Usage ██░░░░░░░░ 25% (1h 30m / 5h)
◐ Edit: auth.ts | ✓ Read ×3 | ✓ Grep ×2
◐ explore [haiku]: Finding auth code (2m 15s)
▸ Fix authentication bug (2/5)
```

### Why It Matters

Claude HUD addresses several pain points with AI coding sessions:

1. **Context anxiety** — Know exactly when you're approaching the limit before Claude starts truncating
2. **Uncertainty** — See what Claude is actually doing instead of wondering if it's stuck
3. **Rate limit surprises** — Track your usage throughout the day to avoid hitting limits unexpectedly
4. **Multi-agent confusion** — When subagents are spawned, see what each one is working on
5. **Session awareness** — Know how long you've been in a session and track progress over time

### Behind the Project

Claude HUD is built by **Jarrod Watts**, a developer focused on improving the Claude Code experience. The plugin is actively maintained and has quickly become one of the most popular Claude Code extensions.

### Requirements

- Claude Code v1.0.80+
- Node.js 18+ or Bun
- Claude Pro/Max/Team subscription for usage limits display (API users see context only)

### Repository

- **GitHub:** [jarrodwatts/claude-hud](https://github.com/jarrodwatts/claude-hud)
- **Stars:** 6,894+ (trending #1 today, 1,038 stars today)
- **Language:** JavaScript/TypeScript
- **License:** MIT

---

_Claude HUD turns the black box of AI coding into a transparent, observable process. No more guessing — just clear visibility into what your AI assistant is doing._
