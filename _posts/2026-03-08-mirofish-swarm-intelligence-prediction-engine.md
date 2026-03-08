---
layout: post
title: "MiroFish - Swarm Intelligence Engine for Predicting Anything"
date: 2026-03-08
categories: [AI, Agents, Simulation]
tags: [swarm-intelligence, multi-agent, prediction, digital-twin, simulation, camel-ai]
---

## 🐟 MiroFish

**MiroFish** is a next-generation AI prediction engine powered by multi-agent swarm intelligence. By extracting "seed" information from the real world (breaking news, policy drafts, financial signals, or even novel stories), it automatically constructs a high-fidelity parallel digital world where thousands of intelligent agents with independent personalities, long-term memory, and behavioral logic freely interact and evolve socially.

Think of it as a **digital sandbox for rehearsing the future** — you can inject variables from a "God's-eye view" to precisely deduce future trajectories and win decisions after countless simulations.

### What Makes MiroFish Different

Unlike traditional prediction models that rely on statistical patterns, MiroFish leverages **collective emergence** — capturing how individual agent interactions lead to unpredictable group behaviors that mirror real-world complexity.

**Two Use Cases:**

- **Macro Level** — A rehearsal laboratory for decision-makers, allowing policies and public relations strategies to be tested at zero risk
- **Micro Level** — A creative sandbox for individual users to deduce novel endings, explore imaginative scenarios, or simulate "what if" situations

### Architecture Overview

MiroFish follows a five-stage pipeline:

| Stage | Description |
|-------|-------------|
| **Graph Building** | Seed extraction, individual/collective memory injection, GraphRAG construction |
| **Environment Setup** | Entity relationship extraction, persona generation, agent configuration |
| **Simulation** | Dual-platform parallel simulation, auto-parse prediction requirements, dynamic temporal memory updates |
| **Report Generation** | ReportAgent with rich toolset for deep interaction with post-simulation environment |
| **Deep Interaction** | Chat with any agent in the simulated world or interact with ReportAgent |

### Key Features

**Multi-Agent Simulation:**
- Thousands of agents with independent personalities and long-term memory
- Social evolution and emergent behaviors
- Built on [OASIS](https://github.com/camel-ai/oasis) by CAMEL-AI

**Flexible Input:**
- Upload seed materials (data reports, news articles, novel chapters)
- Describe prediction requirements in natural language
- Supports both serious predictions and playful simulations

**Interactive Output:**
- Detailed prediction reports
- Deeply interactive high-fidelity digital world
- Chat with any simulated agent

### Demo Examples

The team has showcased impressive demos:

- **Wuhan University Public Opinion Report** — Using their BettaFish variant to predict舆情 (public sentiment) outcomes
- **Dream of the Red Chamber** — Predicting the lost ending based on the first 80 chapters (hundreds of thousands of Chinese characters)
- **Financial & Political Predictions** — More examples coming soon

Try the [live demo](https://666ghj.github.io/mirofish-demo/) to experience a trending public opinion event simulation.

### Quick Start

**Requirements:**
- Node.js 18+
- Python 3.11–3.12
- uv (Python package manager)

**Installation:**

```bash
# Copy example config
cp .env.example .env

# Edit .env with your API keys
# LLM: Alibaba Qwen-plus (or any OpenAI-compatible API)
# Memory: Zep Cloud (free monthly quota available)

# One-click setup
npm run setup:all

# Start both frontend and backend
npm run dev
```

**Service URLs:**
- Frontend: http://localhost:3000
- Backend API: http://localhost:5001

**Docker Deployment:**

```bash
docker compose up -d
```

### Technical Stack

- **Frontend:** Node.js-based UI for configuration and interaction
- **Backend:** Python with multi-agent orchestration
- **LLM:** Supports any OpenAI SDK-compatible API (recommended: Alibaba Qwen-plus via Bailian)
- **Memory:** Zep Cloud for agent long-term memory
- **Simulation Engine:** OASIS (Open Agent Social Interaction Simulations) by CAMEL-AI

### Why It Matters

MiroFish represents a shift from **predictive modeling** to **predictive simulation**. Instead of extrapolating from historical data, it creates a living digital twin where agents behave according to their personas and memories, leading to emergent outcomes that traditional models might miss.

This approach is particularly powerful for:
- **Policy testing** — Simulate public reaction to proposed policies before implementation
- **Crisis management** — Rehearse PR responses to potential scandals
- **Creative exploration** — Explore alternative storylines or historical "what ifs"
- **Financial forecasting** — Model market behavior under different scenarios

### Behind the Project

MiroFish has received strategic support and incubation from **Shanda Group**, a major Chinese investment conglomerate. The team is actively recruiting for full-time and internship positions in multi-agent simulation and LLM applications.

The project builds on the open-source [OASIS](https://github.com/camel-ai/oasis) framework by CAMEL-AI, demonstrating how foundational agent simulation research is enabling practical applications.

### Repository & Resources

- [666ghj/MiroFish](https://github.com/666ghj/MiroFish) — 5,625 stars, 399 stars today
- [Live Demo](https://666ghj.github.io/mirofish-demo/)
- [OASIS Framework](https://github.com/camel-ai/oasis)
- [Demo Video: Wuhan University Report](https://www.bilibili.com/video/BV1VYBsBHEMY/)
- [Demo Video: Dream of the Red Chamber](https://www.bilibili.com/video/BV1cPk3BBExq)
- [Discord Community](https://discord.com/channels/1469200078932545606/1469201282077163739)
- [X (Twitter)](https://x.com/mirofish_ai)

---

*Posted from GitHub Trending #1 - AI-related repository*
