---
layout: post
title: "Promptfoo - Test, Evaluate, and Red-Team Your LLM Applications"
date: 2026-03-12
categories: [AI, Testing, Security]
tags: [llm-evals, red-teaming, prompt-testing, ai-security, typescript, ci-cd]
---

## 🧪 Promptfoo

**Promptfoo** is a CLI and library for evaluating and red-teaming LLM applications. Stop the trial-and-error approach — start shipping secure, reliable AI apps.

### What It Does

Promptfoo helps you:

- **Test prompts and models** with automated evaluations
- **Secure LLM apps** with red teaming and vulnerability scanning
- **Compare models** side-by-side (OpenAI, Anthropic, Azure, Bedrock, Ollama, and more)
- **Automate checks** in CI/CD pipelines
- **Review pull requests** for LLM-related security and compliance issues
- **Share results** with your team

### Why It Matters

Building with LLMs often means guessing whether your prompts work correctly. Promptfoo brings rigor to the process:

1. **Developer-first** — Fast, with live reload and caching
2. **Private** — LLM evals run 100% locally; your prompts never leave your machine
3. **Flexible** — Works with any LLM API or programming language
4. **Battle-tested** — Powers LLM apps serving 10M+ users in production
5. **Data-driven** — Make decisions based on metrics, not gut feel
6. **Open source** — MIT licensed, with an active community

### Quick Start

**Installation:**

```bash
npm install -g promptfoo
# or
brew install promptfoo
# or
pip install promptfoo
# or run without installing
npx promptfoo@latest
```

**Set up your API key:**

```bash
export OPENAI_API_KEY=sk-abc123
```

**Initialize and run:**

```bash
promptfoo init --example getting-started
cd getting-started
promptfoo eval
promptfoo view
```

This generates an evaluation matrix comparing different prompts and models, viewable in a web UI or directly in the terminal.

### Key Features

**1. Automated Evaluations**

Define test cases in YAML or JSON, run them against multiple prompts/models, and get scored results:

```yaml
prompts:
  - "Summarize this article: {{article}}"
  - "Give me the key points: {{article}}"

providers:
  - openai:gpt-4o
  - anthropic:claude-sonnet-4-20250514

tests:
  - vars:
      article: "..."
    assert:
      - type: contains
        value: "key finding"
```

**2. Red Teaming & Security Scanning**

Automatically probe your LLM app for vulnerabilities:

- Prompt injection attacks
- Data leakage
- Harmful content generation
- Jailbreak attempts
- Policy violations

Generates detailed security reports with severity ratings.

**3. Model Comparison**

Run the same evals across different providers to find the best model for your use case — cost, latency, and quality tradeoffs made visible.

**4. CI/CD Integration**

Add LLM quality gates to your pipeline:

```yaml
# .github/workflows/llm-tests.yml
- name: Run LLM evals
  run: promptfoo eval --threshold 0.8
```

Fail builds when quality drops below your standards.

**5. Code Scanning**

Review PRs for LLM-related issues automatically — catch security and compliance problems before merge.

### Documentation

- [Getting Started](https://www.promptfoo.dev/docs/getting-started/)
- [Red Teaming Guide](https://www.promptfoo.dev/docs/red-team/)
- [Full Documentation](https://www.promptfoo.dev/docs/)
- [Supported Providers](https://www.promptfoo.dev/docs/providers/)
- [CI/CD Integration](https://www.promptfoo.dev/docs/integrations/ci-cd/)

### Repository Stats

- **Authors:** typpo, mldangelo, and contributors
- **Stars:** 12,537+ (718 today)
- **Forks:** 1,155+
- **Primary Language:** TypeScript
- **License:** MIT
- **npm:** [promptfoo](https://npmjs.com/package/promptfoo)

### Links & Resources

- [promptfoo/promptfoo](https://github.com/promptfoo/promptfoo)
- [promptfoo.dev](https://www.promptfoo.dev) — Official website
- [Discord Community](https://discord.gg/promptfoo)

---

*Posted from GitHub Trending — AI Testing/Security*
