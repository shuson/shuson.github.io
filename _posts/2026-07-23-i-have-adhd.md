---
layout: post
title: "Trending: i-have-adhd - ADHD-Friendly Output Skill for Coding Agents"
date: 2026-07-23 00:00:00 +0800
categories: [Developer Tools, AI, Productivity]
tags: [adhd, claude-code, claude-skills, coding-agent, developer-tools, productivity]
---

AI coding agents are remarkably capable, but their verbose, rambling responses can bury the actual answer under layers of preamble and fluff. **i-have-adhd** by [ayghri](https://github.com/ayghri) is a skill plugin that solves exactly this problem — it rewires your coding assistant to lead with action, number steps, and skip the platitudes. No ADHD diagnosis needed; anyone who's ever scrolled past three paragraphs to find a one-line fix will appreciate what this does.

Built in Python with a lightweight, model-agnostic architecture, i-have-adhd works by injecting a structured prompt rule-set into the agent's system context. The skill ships as a plugin for Claude Code, Codex, and Cursor, with Gemini extension support and install paths for other coding agents documented in INSTALL.md. It doesn't require any API or backend — it's purely a rules file that reshapes how the model structures its output. Stars: 8,252 ⭐ (+1,699 today).

The core of the project is a 10-rule constraint system: lead with the next action, number multi-step tasks, end with one concrete next step, suppress tangents, restate state every turn, give specific time estimates, make wins visible, handle errors matter-of-factly, cap lists at 5 items, and eliminate all preamble/recap/closer fluff. The before-and-after examples in the README are striking — a three-paragraph ramble becomes a tight, numbered action list. The skill is fully forkable and customizable: edit the SKILL.md rules file, swap in your fork, and restart.

i-have-adhd's surge to #1 trending (gaining nearly 1,700 stars in a day) reflects a growing frustration with AI assistants that prioritize thoroughness over usefulness. As coding agents become ubiquitous, the "last mile" of UX — getting to the point — matters more than ever. This project is a clever, minimal intervention that makes LLM output genuinely more usable, and it's inspiring similar constraint-based skills across the ecosystem. URL: https://github.com/ayghri/i-have-adhd
