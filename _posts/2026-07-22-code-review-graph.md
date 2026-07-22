---
layout: post
title: "Trending: Code Review Graph - Local-First Code Intelligence That Slashes AI Review Tokens"
date: 2026-07-22 00:00:00 +0800
categories: [Developer Tools, AI & LLM, Code Intelligence]
tags: [code-review, mcp, graphrag, tree-sitter, ai-coding, static-analysis, knowledge-graph, llm]
---

AI coding assistants are powerful but expensive: on review tasks they often re-read vast swaths of your codebase, burning tokens and attention on irrelevant files. **Code Review Graph (CRG)** — built by developer **tirth8205** and now the #1 trending repo — attacks this problem head-on. It constructs a persistent, incremental knowledge graph of your codebase using Tree-sitter and gives AI tools a precise roadmap so they read only what actually matters.

CRG is written primarily in **Python** (3.10+) and ships as a local-first tool that integrates with the Model Context Protocol (MCP). The core innovation is a structural code graph that tracks dependencies, symbols, and changes incrementally — rather than treating code as flat text, it builds a semantic map that AI tools query on-demand. Stars: **24,524 ⭐** — a remarkable trajectory for a project that only launched in late February 2026.

Feature highlights include **one-command installation** that auto-detects your AI coding platform (Claude Code, Codex, Cursor, Gemini CLI, GitHub Copilot, CodeBuddy, and Kiro), writes the correct MCP configuration, and injects graph-aware instructions into your platform rules. The `code-review-graph build` command parses the entire codebase into a graph, while incremental updates keep it fresh without full rebuilds. Benchmark tests show significant context reduction on large-repo review workflows, and a VS Code extension ships alongside the CLI for visual graph exploration. A symmetric `uninstall` command cleanly removes all CRG artifacts with atomic file replacement, leaving no mess.

Why it's trending: as teams scale AI-assisted development, the cost of blindly shoving entire codebases into context windows has become a hard bottleneck. CRG brings graph-based reasoning to AI coding toolchains — a local, open-source approach to making LLMs smarter about what they read. It's a glimpse of the future where AI doesn't just see code as tokens but understands it as structure. URL: https://github.com/tirth8205/code-review-graph
