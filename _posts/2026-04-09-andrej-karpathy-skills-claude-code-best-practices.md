---
layout: post
title: "Andrej Karpathy Skills - Four Principles to Fix Claude Code's Worst Habits"
date: 2026-04-09
categories: [AI, Developer Tools, Best Practices]
tags: [claude-code, andrej-karpathy, ai-coding, llm, best-practices, claudemd, agent-skills]
---

## 🚀 Andrej Karpathy Skills

**forrestchang/andrej-karpathy-skills** is the #1 trending repo on GitHub today with over 8,900 stars and 702 stars gained in 24 hours. It distills Andrej Karpathy's observations on LLM coding pitfalls into a single `CLAUDE.md` file that dramatically improves Claude Code's behavior.

### What It Is

This is a **Claude Code plugin** (or standalone `CLAUDE.md` file) that encodes four principles to address the most common frustrations when working with AI coding assistants. Based on [Karpathy's viral tweet](https://x.com/karpathy/status/2015883857489522876), it tackles the exact problems every developer faces when pairing with LLMs.

From Andrej:

> "The models make wrong assumptions on your behalf and just run along with them without checking. They don't manage their confusion, don't seek clarifications, don't surface inconsistencies, don't present tradeoffs, don't push back when they should."

> "They really like to overcomplicate code and APIs, bloat abstractions, don't clean up dead code... implement a bloated construction over 1000 lines when 100 would do."

This plugin fixes all of that.

### The Four Principles

| Principle | Addresses |
|-----------|-----------|
| **Think Before Coding** | Wrong assumptions, hidden confusion, missing tradeoffs |
| **Simplicity First** | Overcomplication, bloated abstractions |
| **Surgical Changes** | Orthogonal edits, touching code you shouldn't |
| **Goal-Driven Execution** | Leverage through tests-first, verifiable success criteria |

### Principle 1: Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

LLMs often pick an interpretation silently and run with it. This principle forces explicit reasoning:

- **State assumptions explicitly** — If uncertain, ask rather than guess
- **Present multiple interpretations** — Don't pick silently when ambiguity exists
- **Push back when warranted** — If a simpler approach exists, say so
- **Stop when confused** — Name what's unclear and ask for clarification

### Principle 2: Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

Combat the tendency toward overengineering:

- No features beyond what was asked
- No abstractions for single-use code
- No "flexibility" or "configurability" that wasn't requested
- No error handling for impossible scenarios
- If 200 lines could be 50, rewrite it

**The test:** Would a senior engineer say this is overcomplicated? If yes, simplify.

### Principle 3: Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

- Don't "improve" adjacent code, comments, or formatting
- Don't refactor things that aren't broken
- Match existing style, even if you'd do it differently
- If you notice unrelated dead code, mention it — don't delete it

When your changes create orphans:

- Remove imports/variables/functions that YOUR changes made unused
- Don't remove pre-existing dead code unless asked

**The test:** Every changed line should trace directly to the user's request.

### Principle 4: Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform imperative tasks into verifiable goals:

| Instead of... | Transform to... |
|---------------|-----------------|
| "Add validation" | "Write tests for invalid inputs, then make them pass" |
| "Fix the bug" | "Write a test that reproduces it, then make it pass" |
| "Refactor X" | "Ensure tests pass before and after" |

For multi-step tasks, state a brief plan:

```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let the LLM loop independently. Weak criteria ("make it work") require constant clarification.

### Installation

**Option A: Claude Code Plugin (Recommended)**

From within Claude Code:

```bash
# Add the marketplace
/plugin marketplace add forrestchang/andrej-karpathy-skills

# Install the plugin
/plugin install andrej-karpathy-skills@karpathy-skills
```

This installs the guidelines as a Claude Code plugin, making the skill available across all your projects.

**Option B: CLAUDE.md (Per-Project)**

For a new project:
```bash
curl -o CLAUDE.md https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md
```

For an existing project (append):
```bash
echo "" >> CLAUDE.md
curl https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md >> CLAUDE.md
```

### Why It Stands Out

**🎯 Addresses Real Pain Points:**
- Every developer has experienced LLM overcomplication
- Drive-by refactoring is a universal frustration
- Hidden assumptions lead to costly mistakes

**📦 Dead Simple:**
- Single file, four principles
- No complex setup or configuration
- Works as a plugin or standalone `CLAUDE.md`

**🧠 Battle-Tested Wisdom:**
- Derived from Andrej Karpathy's extensive LLM coding experience
- Encodes hard-won lessons into actionable guidelines
- Designed to be merged with project-specific instructions

**🔧 Measurable Impact:**
- Fewer unnecessary changes in diffs
- Fewer rewrites due to overcomplication
- Clarifying questions come before implementation
- Clean, minimal PRs — no drive-by refactoring

### When to Use It

**Use Andrej Karpathy Skills if:**
- You use Claude Code regularly for coding tasks
- You're frustrated by overcomplicated solutions
- You want cleaner, more focused PRs
- You value simplicity and surgical precision

**Note:** These guidelines bias toward caution over speed. For trivial tasks (simple typo fixes, obvious one-liners), use judgment — not every change needs the full rigor. The goal is reducing costly mistakes on non-trivial work.

### Tips & Gotchas

**Getting Started:**
- Install as a plugin for global availability across projects
- Or add to existing `CLAUDE.md` files for project-specific use
- Review the principles once — they'll become second nature

**Combining with Project Rules:**
- These guidelines are designed to merge with project-specific instructions
- Add your own sections below the four principles:

```markdown
## Project-Specific Guidelines

- Use TypeScript strict mode
- All API endpoints must have tests
- Follow the existing error handling patterns in `src/utils/errors.ts`
```

**When to Relax the Rules:**
- For trivial tasks, not every change needs full rigor
- Use judgment — the goal is reducing costly mistakes, not slowing down simple work

### Built With

- **CLAUDE.md** — Claude Code configuration format
- **Markdown** — Human-readable guidelines
- **Four Principles** — Distilled from Karpathy's observations

### Repository & Resources

- [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills)
- [Andrej Karpathy's Original Tweet](https://x.com/karpathy/status/2015883857489522876)
- [CLAUDE.md Specification](https://claude.ai/code)

---

*Posted from GitHub Trending - Better AI Coding with Karpathy's Principles*
