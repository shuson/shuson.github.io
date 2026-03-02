---
layout: post
title: "Deer Flow - Bytedance's Open-Source SuperAgent Harness"
date: 2026-03-02
categories: [AI, Agents, Research]
tags: [superagent, multi-agent, bytedance, langchain, langgraph, sandbox]
---

## 🦌 Deer Flow

**Deer Flow** (Deep Exploration and Efficient Research Flow) is an open-source SuperAgent harness from Bytedance that orchestrates sub-agents, memory, and sandboxes to handle complex tasks that could take minutes to hours.

### From Deep Research to SuperAgent Harness

DeerFlow started as a Deep Research framework, but the community pushed it far beyond research — building data pipelines, generating slide decks, spinning up dashboards, and automating content workflows. 

**DeerFlow 2.0** is a ground-up rewrite that shares no code with v1. It's no longer just a framework you wire together — it's a complete super agent harness with everything an agent needs out of the box.

### Core Features

**Skills & Tools**
- Standard Agent Skills are structured capability modules (Markdown files) defining workflows and best practices
- Built-in skills for research, report generation, slide creation, web pages, image/video generation
- Extensible: add your own skills or combine them into compound workflows
- Core toolset: web search, web fetch, file operations, bash execution
- Custom tools via MCP servers and Python functions

**Sub-Agents**
- Lead agent spawns sub-agents on the fly with scoped context and tools
- Sub-agents run in parallel when possible
- Complex tasks decomposed into multiple focused agents
- Results synthesized into coherent output

**Sandbox & File System**
- Each task runs in an isolated Docker container with full filesystem
- Agent reads, writes, edits files, executes bash commands
- Zero contamination between sessions
- Paths: `/mnt/user-data/uploads/`, `/mnt/user-data/workspace/`, `/mnt/user-data/outputs/`

**Long-Term Memory**
- Persistent memory across sessions
- Remembers your profile, preferences, and accumulated knowledge
- Stored locally under your control

**Context Engineering**
- Aggressive context management within sessions
- Summarizes completed sub-tasks
- Offloads intermediate results to filesystem
- Works well with token-sensitive models

### Tech Stack

- Built on **LangChain** and **LangGraph**
- Model-agnostic (any OpenAI-compatible API)
- Best with models supporting:
  - Long context windows (100k+ tokens)
  - Reasoning capabilities
  - Multimodal inputs
  - Strong tool-use/function calling

### Quick Start

```bash
# Clone and configure
git clone https://github.com/bytedance/deer-flow.git
cd deer-flow
make config

# Docker (recommended)
make docker-init
make docker-start

# Access: http://localhost:2026
```

### GitHub Stats

- ⭐ **Trending #5** today (claimed #1 on Feb 28, 2026!)
- 🏆 Version 2.0 just launched
- 👥 Built by Daniel Walnut, Henry Li, and team

### Why It Matters

DeerFlow represents the evolution from simple chatbots with tool access to **agents with actual execution environments**. The difference between talking about doing things and having your own isolated computer to do them on.

With sub-agent orchestration, sandboxed execution, and persistent memory, DeerFlow handles multi-step tasks that take minutes to hours — not just quick Q&A exchanges.

### Repository & Resources

- [bytedance/deer-flow](https://github.com/bytedance/deer-flow)
- [Official Website](https://deerflow.tech/)
- [Contributing Guide](https://github.com/bytedance/deer-flow/blob/main/CONTRIBUTING.md)

---

*Posted from GitHub Trending #5 - AI-related repository*
