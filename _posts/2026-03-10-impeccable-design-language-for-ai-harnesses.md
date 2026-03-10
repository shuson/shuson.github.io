---
layout: post
title: "Impeccable - Design Language for AI-Powered Frontend Development"
date: 2026-03-10
categories: [AI, Design, Frontend]
tags: [ai-design, cursor, claude-code, gemini-cli, frontend, design-system]
---

## 🎨 Impeccable

**Impeccable** is a comprehensive design language and skill system that makes your AI harness (Cursor, Claude Code, Gemini CLI, Codex CLI) significantly better at frontend design. Created by Paul Bakaus, it builds on Anthropic's original frontend-design skill with deeper expertise and far more control.

### The Problem It Solves

Every LLM trained on generic templates produces predictable mistakes:

- Overused fonts (Inter, Arial, system defaults)
- Purple gradients everywhere
- Cards nested inside cards
- Gray text on colored backgrounds
- Pure black/gray without tinting
- Dated bounce/elastic easing

Impeccable fights these biases with explicit anti-patterns and domain-specific expertise.

### What's Inside

**17 Steering Commands:**

| Command | Purpose |
|---------|---------|
| `/teach-impeccable` | One-time setup: gather design context, save to config |
| `/audit` | Run technical quality checks (a11y, performance, responsive) |
| `/critique` | UX design review: hierarchy, clarity, emotional resonance |
| `/normalize` | Align with design system standards |
| `/polish` | Final pass before shipping |
| `/distill` | Strip to essence |
| `/clarify` | Improve unclear UX copy |
| `/optimize` | Performance improvements |
| `/harden` | Error handling, i18n, edge cases |
| `/animate` | Add purposeful motion |
| `/colorize` | Introduce strategic color |
| `/bolder` | Amplify boring designs |
| `/quieter` | Tone down overly bold designs |
| `/delight` | Add moments of joy |
| `/extract` | Pull into reusable components |
| `/adapt` | Adapt for different devices |
| `/onboard` | Design onboarding flows |

Most commands accept optional arguments to focus on specific areas:
```bash
/audit header
/polish checkout-form
```

**7 Domain-Specific Reference Files:**

| Reference | Covers |
|-----------|--------|
| [typography](https://github.com/pbakaus/impeccable/blob/main/source/skills/frontend-design/reference/typography.md) | Type systems, font pairing, modular scales, OpenType |
| [color-and-contrast](https://github.com/pbakaus/impeccable/blob/main/source/skills/frontend-design/reference/color-and-contrast.md) | OKLCH, tinted neutrals, dark mode, accessibility |
| [spatial-design](https://github.com/pbakaus/impeccable/blob/main/source/skills/frontend-design/reference/spatial-design.md) | Spacing systems, grids, visual hierarchy |
| [motion-design](https://github.com/pbakaus/impeccable/blob/main/source/skills/frontend-design/reference/motion-design.md) | Easing curves, staggering, reduced motion |
| [interaction-design](https://github.com/pbakaus/impeccable/blob/main/source/skills/frontend-design/reference/interaction-design.md) | Forms, focus states, loading patterns |
| [responsive-design](https://github.com/pbakaus/impeccable/blob/main/source/skills/frontend-design/reference/responsive-design.md) | Mobile-first, fluid design, container queries |
| [ux-writing](https://github.com/pbakaus/impeccable/blob/main/source/skills/frontend-design/reference/ux-writing.md) | Button labels, error messages, empty states |

### Installation

**Get Started:** Visit [impeccable.style](https://impeccable.style) to download ready-to-use bundles for your AI harness.

**Cursor:**
```bash
cp -r dist/cursor/.cursor your-project/
```
*Note: Requires Nightly channel + Agent Skills enabled in Cursor Settings → Rules*

**Claude Code:**
```bash
# Project-specific
cp -r dist/claude-code/.claude your-project/

# Or global (applies to all projects)
cp -r dist/claude-code/.claude/* ~/.claude/
```

**Gemini CLI:**
```bash
cp -r dist/gemini/.gemini your-project/
```
*Note: Requires preview version (`npm i -g @google/gemini-cli@preview`) + Skills enabled*

**Codex CLI:**
```bash
cp -r dist/codex/.codex/* ~/.codex/
```
*Note: Uses different syntax (`/prompts:audit`, `/prompts:polish`, etc.)*

### Why It Matters

Impeccable represents a shift from **hoping AI designs well** to **engineering AI design behavior**. Instead of vague prompts like "make it look good," you get:

1. **Explicit anti-patterns** — Clear guidance on what NOT to do
2. **Domain expertise** — Seven specialized reference files covering all aspects of frontend design
3. **Actionable commands** — 17 specific operations for auditing, polishing, and refining designs
4. **Cross-platform support** — Works with all major AI harnesses

### Case Studies

Visit [impeccable.style#casestudies](https://impeccable.style#casestudies) to see before/after transformations of real projects. The site demonstrates how Impeccable commands systematically improve:

- Visual hierarchy and clarity
- Color systems and accessibility
- Typography and readability
- Motion and interaction design
- Overall polish and professionalism

### Supported AI Harnesses

- [Cursor](https://cursor.com) — AI-first code editor
- [Claude Code](https://claude.ai/code) — Anthropic's CLI agent
- [Gemini CLI](https://github.com/google-gemini/gemini-cli) — Google's CLI agent
- [Codex CLI](https://github.com/openai/codex) — OpenAI's CLI agent

### Repository Stats

- **Author:** pbakaus (Paul Bakaus)
- **Stars:** 2,929+
- **Forks:** 109+
- **Stars Today:** 1,288
- **Primary Language:** JavaScript
- **License:** Apache 2.0

### Links & Resources

- [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
- [impeccable.style](https://impeccable.style) — Download bundles & case studies
- [Anthropic's Original frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design)
- [DEVELOP.md](https://github.com/pbakaus/impeccable/blob/main/DEVELOP.md) — Contributor guidelines
- [NOTICE.md](https://github.com/pbakaus/impeccable/blob/main/NOTICE.md) — Attribution

---

*Posted from GitHub Trending — Design/AI tooling repository*
