---
layout: post
title: "Trending: diagram-design - Editorial Diagrams Your Designer Won't Hate"
date: 2026-08-14 00:00:00 +0800
categories: [Developer Tools, Design, AI]
tags: [Claude-Code, diagrams, SVG, HTML, editorial-design, developer-tools]
---

What if every diagram your AI coding agent produced actually looked good? That's the question Cathryn Lavery set out to answer with `diagram-design`, a curated library of 27 editorial-grade diagram types that ships as self-contained HTML + SVG — no JavaScript, no external dependencies, no generic Mermaid-slop. Built for AI coding agents like Claude Code, Codex, and Pi, the skill reads your brand's visual identity from your website in about 60 seconds and produces diagrams that match, eliminating the eternal tug-of-war between developer velocity and design quality.

Under the hood, `diagram-design` is predominantly HTML (1.4M lines) with supporting Python scripts (310K lines), released under the MIT license. The standout architectural innovation is the 2.3 semantic system: instead of hard-coding every possible diagram variant, it treats layout and behavior as orthogonal concerns. Semantic patterns — queues, policy traces, trust boundaries — describe *behavior* separately from layout, so new workflows map to the nearest existing visual type without bloating the type count. The Loop (v2.0) introduces flywheel diagrams with a shared-memory hub and dashed write-back lines. Version 2.3 adds optional accessible motion for ordered explanations, while keeping static HTML as the default. Stars: 14,423 ⭐ (+144 on trend).

The 27 visual types cover the full editorial spectrum: architecture (components + connections), flowcharts (decision logic), sequence diagrams (messages over time), state machines (states + transitions), ER/data models (entities + fields), timelines (events on an axis), swimlanes (cross-functional flows), quadrants (two-axis positioning), nested hierarchies, trees, org charts, pyramids, mind maps, Sankey diagrams, Gantt charts, and more. Each type ships in three variants — minimal light, minimal dark, and full-editorial — and opens directly in a browser. The skill can also redraw existing draw.io or Mermaid sources at any format, size, and detail level. Plugins for Claude Code, Codex, and Pi are included with automatic marketplace updates.

Lavery's philosophy is that "the highest-quality move is usually deletion" — every node earns its place, accent color is reserved for the 1–2 things the reader should see first, and target visual density stays at 4/10. In a world where AI-generated diagrams default to generic rounded boxes and 30-minute color-picking sessions, `diagram-design` brings editorial discipline to agent-generated visuals. For anyone who's ever skipped a diagram because Figma felt like overkill, this is the missing bridge between code and craft. URL: https://github.com/cathrynlavery/diagram-design
