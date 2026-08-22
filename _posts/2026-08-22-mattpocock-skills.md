---
layout: post
title: "Trending: Matt Pocock Skills - Agentic Skills for Real Engineering"
date: 2026-08-22 00:00:00 +0800
categories: [AI, Developer Tools, Open Source]
tags: [skills, agentic-ai, claude-code, codex, developer-productivity, llm]
---

Matt Pocock's **Skills** is a curated collection of agent skills designed for *real engineering* — not vibe coding. With over 229,000 stars, this is the personal `.agents` directory of Matt Pocock, the well-known TypeScript educator, turned into a reusable, battle-tested toolkit that addresses the most common failure modes developers face when working with AI coding agents like Claude Code and Codex. The repo embodies a philosophy that skills should be small, composable, and hackable — giving developers control rather than locking them into an opaque process like GSD, BMAD, or Spec-Kit.

The project is built primarily as shell-based skill definitions with TypeScript tooling, leveraging a modular architecture where each skill is a self-contained unit that can be composed together. It ships as both a Claude Code plugin (managed, read-only auto-updating bundle) and a `skills.sh` installer (editable copies you can hack on). Stars: 229,458 ⭐ (19.6K forks). The skills are model-agnostic and based on decades of engineering experience, with 454 commits and 100 branches reflecting active, sustained development.

Key features include **`/grill-me`** and **`/grill-with-docs`** — the project's most popular skills that solve misalignment by having the agent conduct a thorough questioning session before writing code, inspired by *The Pragmatic Programmer*'s observation that "no one knows exactly what they want." It also tackles verbose agent outputs via a **ubiquitous language** approach, provides structured code review workflows (`/review`), implementation planning (`/implement-spec`), and issue triage (`/triage`) with support for GitHub Issues, Linear, and local file-based trackers. A one-time `/setup-matt-pocock-skills` command bootstraps a project in seconds.

This repository is trending because it distills hard-won lessons from a practitioner who uses these skills *every day* to ship production software. It's not theoretical — it ships out of Pocock's own `.agents` directory, and his newsletter tracking these skills has attracted over 60,000 developers. As the coding agent ecosystem matures, the community is gravitating toward proven, battle-tested patterns over speculative frameworks, and this repo provides exactly that: a pragmatic starting point that you can adapt to your own workflow.

URL: https://github.com/mattpocock/skills
