---
layout: post
title: "Trending: ai-job-search - AI-Powered Job Application Framework on Claude Code"
date: 2026-07-10 00:00:00 +0800
categories: [AI, Developer Tools, Career]
tags: [claude-code, job-search, automation, open-source, typescript, ai-agents]
---

The job hunt is one of the most universally dreaded activities in professional life — combing through listings, tailoring résumés, and writing yet another cover letter that doesn't sound like a template. **ai-job-search**, created by Mads Lorentzen, reimagines this entire process as an AI-native workflow. Fork the repo, fill in your profile, and Claude Code takes over: it scrapes job boards, evaluates postings against your background, scores fit, drafts tailored CVs and cover letters in LaTeX, and even prepares you for interviews. The framework encodes career guidance best practices directly into its agent skills, including structured evaluation criteria and forward-looking cover letter framing.

Built in TypeScript with a Python-powered job scraper and LaTeX for professional document generation, the project is organized around a clean command-line workflow. The `/setup` command walks you through building a detailed profile. `/scrape` searches configured job portals (currently optimized for the Danish market but designed to be swapped for any region). `/apply <url>` triggers the core pipeline: a drafter agent produces a tailored CV and cover letter, a reviewer agent critiques them, and the system iterates until the output is polished. The CV compiles with `lualatex` and the cover letter with `xelatex`, while an optional ATS parseability check uses `pdftotext` to verify machine-readability. Stars: 18,936 ⭐ (+18,900 since March).

Standout capabilities include country-agnostic core workflows that work anywhere, a dual-agent drafter-reviewer pipeline for quality assurance, LaTeX-based CV and cover letter generation with multiple template styles, interview preparation via a `/interview` command with stage-specific coaching, and a pluggable skills architecture (`.agents/skills`) that lets the community add new job board integrations. Recent community contributions include `freehire-search` for country-agnostic job aggregation and comprehensive schema documentation for the `seen_jobs.json` ranking system, showing rapid ecosystem growth.

What makes this project remarkable is that it captures something deeper than automation — it encodes the unwritten rules of effective job applications into reproducible agent instructions. With 18.9k stars, 5.5k forks, and active community contributions in just under four months, it's clear that the pain point of job searching resonates globally, and developers are eager for tools that turn AI from a chatbot into a genuine career ally. URL: https://github.com/MadsLorentzen/ai-job-search
