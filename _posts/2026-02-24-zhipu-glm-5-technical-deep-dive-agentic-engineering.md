---
layout: post
title: "Zhipu GLM-5 Technical Deep Dive: Agentic Engineering with Sparse Attention and Asynchronous RL"
tags:
    - AI
    - LLM
    - GLM-5
    - Zhipu
    - sparse attention
    - reinforcement learning
    - open-source
---

Zhipu AI has released a comprehensive 40-page technical paper detailing GLM-5, their latest open-source large language model. The paper, titled "Goodbye Vibe Coding, Hello Agentic Engineering," reveals three key technical innovations that enable GLM-5 to handle complex, long-duration tasks with significantly improved cost efficiency.

## Overview

GLM-5 builds upon the ARC (Agentic, Reasoning, and Coding) capabilities and MoE (Mixture of Experts) architecture from GLM-4.5, addressing two major bottlenecks in deploying large models for real-world engineering tasks: **computational cost** and **training efficiency**.

Key achievements:
- Can run code continuously for 24+ hours with 700+ tool calls and 800+ context switches
- Built a Game Boy Advance (GBA) emulator from scratch autonomously
- Achieves 77.8% on SWE-bench Verified, matching Claude Opus 4.5
- First open-weight model to reach 50 points on Artificial Analysis Intelligence Index v4.0

## Key Innovation 1: Dynamic Sparse Attention (DSA)

### The Problem

Traditional dense attention in Transformers scales quadratically (O(N²)) with context length. At 200K+ token contexts, computational costs become prohibitive for agent workloads.

### The Solution

GLM-5 introduces **Dynamic Sparse Attention (DSA)**, inspired by DeepSeek's approach. Unlike fixed sliding window patterns, DSA dynamically selects which tokens are important through a fine-grained selection mechanism.

### Training Strategy

The team employed a clever continued pre-training approach:

1. **Dense Warm-up**: Initial training uses dense attention (similar to MLA variant) to build robust global semantic representations
2. **Sparse Training**: Gradually increase sparsity, where DSA only computes attention for Top-K most relevant tokens via a dynamic routing mechanism

### Results

| Metric | Improvement |
|--------|-------------|
| KV Cache overhead | ↓ 75% (4x concurrent requests) |
| Inference speed | ↑ 3x faster |
| Long-text capability | <0.5% performance drop vs dense model |

The model maintains near-identical performance on "needle in a haystack" and RULER benchmarks while dramatically reducing computational costs.

## Key Innovation 2: Asynchronous Multi-Task Reinforcement Learning

### The Problem

Standard PPO (Proximal Policy Optimization) is highly synchronous, requiring four models (Actor, Reference, Critic, Reward) to coordinate across multiple GPUs. This results in GPU utilization hovering around 20-30%, with most compute wasted on network communication and synchronization.

### The Solution

Zhipu rewrote their RL infrastructure from the ground up based on the Slime framework from GLM-4.5, implementing **fully asynchronous training**:

- **Decoupled engines**: Training and inference run on separate GPU devices
- **Continuous trajectory generation**: Inference engine generates trajectories, sending batches to training engine when thresholds are met
- **Periodic weight sync**: Inference model weights sync regularly with training side to reduce policy lag

### Key Technical Challenges Solved

**1. Token-in-Token-out (TITO)**

Instead of Text-in-Text-out where the training engine re-tokenizes final text, TITO directly consumes the exact tokenization from the inference engine. This prevents subtle mismatches in token boundaries, whitespace handling, and special token placement that could affect sampling probability estimates.

**2. Direct Dual-Sided Importance Sampling**

In asynchronous settings, tracking exact historical behavior probabilities is computationally infeasible. GLM-5 uses:
- Rollout-period log-probabilities as direct behavior proxies
- Importance sampling ratio: rt(θ) = πθ / πrollout
- Dual-sided calibrated token-level masking with trust region [1-ε_l, 1+ε_h]

**3. DP-Aware Routing for Long-Context Inference**

Sequential requests from the same rollout share prefixes. The team uses:
- Consistent hashing to map rollout IDs to fixed Data Parallel ranks
- Lightweight dynamic load rebalancing on hash space
- Eliminates redundant prefill computation without KV sync across DP ranks

### Training Data

GLM-5 uses mixed RL training across four domains with balanced distribution:
- Mathematics
- Science
- Code
- Tool-Integrated Reasoning (TIR)

Data sources include open-source datasets, externally labeled STEM problems, Codeforces, and TACO datasets.

## Key Innovation 3: Real-World Environment Data

### SFT Corpus

The supervised fine-tuning corpus covers three categories:
- General conversation
- Reasoning
- Programming & Agent

GLM-5 extends maximum context length to **202,752 tokens** during SFT and supports three thinking modes:

| Mode | Description |
|------|-------------|
| Interleaved Thinking | Model thinks before each response and tool call |
| Preserved Thinking | Coding Agent retains all thinking blocks across turns for reuse |
| Turn-Level Thinking | Fine-grained control per turn; disable for low-latency, enable for complex tasks |

### Executable Environments for Agent RL

**Software Engineering Environment**
- Based on real-world Issue-PR pairs
- RepoLaunch framework auto-analyzes repo installation and dependencies
- 10,000+ verifiable environments across thousands of repos
- Covers 9 languages: Python, Java, Go, C, C++, JavaScript, TypeScript, PHP, Ruby

**Terminal Environment**
- Three-stage agent data synthesis: task draft → concrete implementation → iterative refinement
- Dockerized execution environments with test scripts
- 90%+ Docker build accuracy

**Search Tasks**
- Web knowledge graph with multi-hop neighborhood expansion
- Three-stage filtering to ensure high-quality, high-difficulty multi-hop QA pairs

**PPT Generation**
- Multi-level reward mechanism (static markup → runtime rendering → visual perception)
- 16:9 aspect ratio compliance improved from 40% to 92%

## Benchmark Results

### Traditional Benchmarks

| Benchmark | GLM-5 Score | Comparison |
|-----------|-------------|------------|
| SWE-bench Verified | 77.8% | Matches Claude Opus 4.5, exceeds Gemini 3 Pro |
| Humanity's Last Exam (with tools) | 50.4 | Better than Claude Opus 4.5 & Gemini 3 Pro |
| Artificial Analysis Intelligence Index v4.0 | 50 | First open-weight model to reach 50 |

### CC-Bench-V2 (New Benchmark)

Zhipu argues traditional SWE-bench is outdated (static, public, 2+ years old with potential memorization effects). They introduced **CC-Bench-V2**, a fully automated benchmark simulating real software development:

**Frontend Evaluation** (Agent-as-a-Judge via GUI Agent)
- Build Success Rate (BSR): 98.0%
- Check Success Rate (CSR): Competitive with Claude Opus 4.5

**Backend Evaluation**
- Pass@1 on real open-source projects: 25.8% (matches Claude Opus 4.5, significantly ahead of GLM-4.7)

**Long-Range Tasks**
- Built from merged Pull Requests to create multi-step chained tasks
- GLM-5 shows significant improvement over GLM-4.7 but still trails Claude Opus 4.5
- Team acknowledges gap is due to error accumulation in chained tasks, requiring breakthroughs in long-context consistency and long-range self-correction

## Chip Compatibility

GLM-5 achieves full-stack adaptation with Chinese domestic chips:
- Huawei Ascend (昇腾)
- Moore Threads (摩尔线程)
- Hygon (海光)
- Cambricon (寒武纪)
- KunlunXin (昆仑芯)
- Iluvatar CoreX (沐曦)
- Enflame (燧原)

## Conclusion

GLM-5 demonstrates three critical advances:

1. **First "full-stack engineer" in open-source** — AI can autonomously execute ultra-long, ultra-complex tasks
2. **Validated unified MoE architecture** — Single model successfully integrates Agent, Reasoning, and Coding capabilities
3. **Proven RL potential in complex code generation** — Significant impact on closed-source model competitiveness

The paper suggests that open-source models are entering the "long-task era," where cost efficiency and real-world adaptability are as important as raw capability.

---

**Paper**: [arXiv:2602.15763](https://arxiv.org/abs/2602.15763)

**Source**: Originally published by 量子位 (QbitAI), republished via 36Kr
