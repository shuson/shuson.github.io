---
layout: post
title: "Last30days Skill - AI Research Agent for Trending Topics"
date: 2026-03-26
categories: [AI, Agents, Research]
tags: [claude-code, ai-agent, research, social-media, openclaw, skill]
---

## 📰 Last30days Skill

**Last30days Skill** is trending #1 on GitHub today with over 7,500 stars and 1,341 stars gained in the last 24 hours. It's an AI agent skill that researches any topic across Reddit, X, YouTube, Hacker News, Polymarket, Bluesky, TikTok, and Instagram — then synthesizes a grounded summary with real citations.

### What It Is

Last30days is a Claude Code skill (also works with Gemini CLI and Codex) that keeps you current on any topic by researching what people are actually discussing, upvoting, and sharing across multiple platforms in the last 30 days. Whether it's the latest AI tools, prompting techniques, viral trends, or breaking news, you get a comprehensive briefing with real citations.

### Key Features

**Multi-Platform Research:**
- **Reddit** - Subreddit discovery, posts, and top comments with upvote counts
- **X (Twitter)** - Posts from relevant accounts and trending topics
- **YouTube** - Video search with transcript analysis
- **Hacker News** - Technical community discussions and Show HN posts
- **Polymarket** - Prediction markets showing what people are betting on
- **Bluesky** - AT Protocol social search (opt-in)
- **TikTok & Instagram** - Short-form video content via ScrapeCreators

**Smart Scoring & Deduplication:**
- Multi-signal quality-ranked relevance scoring
- Cross-platform convergence detection
- Engagement velocity normalization
- Temporal recency decay
- Bidirectional text similarity with synonym expansion

**Comparative Mode (New in v2.9.5):**
- Ask "X vs Y" questions (e.g., "Cursor vs Windsurf")
- Get 3 parallel research passes with side-by-side comparison
- Strengths, weaknesses, head-to-head table, and data-driven verdict

**Auto-Save Research Library:**
- Every run saves complete briefing to `~/Documents/Last30Days/`
- Build a personal research library automatically
- Topic-named `.md` files for easy reference

**Watchlist Mode (Open Variant):**
- Add topics to a watchlist for periodic research
- Designed for always-on bots like Open Claw
- Accumulates findings in local SQLite database
- Ask for briefings anytime on watched topics

### Architecture

The skill uses a sophisticated multi-pass research pipeline:

1. **Query Expansion** - Two-pass expansion with tag-based domain bridging
2. **Parallel Search** - Up to 10 sources searched simultaneously
3. **Scoring Pipeline** - Composite scoring with 5+ factors per source
4. **Deduplication** - Hybrid trigram-token Jaccard similarity
5. **Synthesis** - Grounded narrative with real citations

**Authentication:**
- X search via cookies (`AUTH_TOKEN`, `CT0`) or xAI API fallback
- ScrapeCreators API key covers Reddit + TikTok + Instagram (one key, three sources)
- Bluesky via handle + app password (opt-in)
- Per-project `.claude/last30days.env` for project-specific config

### Installation

**Claude Code Plugin (Recommended):**
```bash
/plugin marketplace add mvanhorn/last30days-skill
/plugin install last30days@last30days-skill
```

**ClawHub (for Open Claw):**
```bash
clawhub install last30days-official
```

**Manual Install:**
```bash
git clone https://github.com/mvanhorn/last30days-skill.git ~/.claude/skills/last30days
```

### Usage Examples

```bash
# Research a topic
/last30days AI video tools

# Comparative mode
/last30days cursor vs windsurf

# Quick mode (faster, less thorough)
/last30days --quick latest prompting techniques

# Specific time window
/last30days --days=7 Nano Banana Pro
```

### Why It Matters

Last30days solves a real problem: **the AI world reinvents itself every month**. Traditional search gives you static results; this skill gives you what the community is *actually* talking about right now. It's particularly valuable for:

1. **Prompt Research** - Discover what prompting techniques actually work
2. **Competitive Intelligence** - Track competitors and industry trends
3. **Learning New Tools** - Get up to speed on any new AI tool quickly
4. **Stay Current** - Never miss important developments in your field

The tradeoff: thorough research takes 2-8 minutes depending on topic niche-ness. But the depth and quality of insights are worth the wait.

### Repository & Resources

- [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill)
- [ClawHub Package](https://clawhub.ai/skills/last30days-official)
- v2.9.5 with Bluesky, Comparative Mode, and Config Improvements

---

*Posted from GitHub Trending #1 - AI/Research repository*
