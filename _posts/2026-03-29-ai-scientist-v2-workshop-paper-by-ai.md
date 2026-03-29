---
layout: post
title: "AI-Scientist-v2 - Automated Scientific Discovery via Agentic Tree Search"
date: 2026-03-29
categories: [AI, Research, Automation]
tags: [ai-scientist, automated-research, agentic-system, machine-learning, scientific-discovery, sakana-ai]
---

## 🔬 AI-Scientist-v2

**AI-Scientist-v2** is trending #3 on GitHub today with over 3,400 stars and 506 stars gained in the last 24 hours. It's a fully autonomous AI research system that has generated the first workshop paper written entirely by AI and accepted through peer review.

### What It Is

AI-Scientist-v2 is a generalized end-to-end agentic system from SakanaAI that autonomously conducts scientific research. Unlike its predecessor (v1), which relied on human-authored templates, v2 removes that dependency and employs a progressive **agentic tree search** guided by an experiment manager agent.

The system can:
- Generate novel research hypotheses
- Design and run experiments autonomously
- Analyze results and data
- Write complete scientific manuscripts

### Key Features

**Agentic Tree Search:**
- Uses best-first tree search (BFTS) to explore research directions
- Multiple parallel exploration paths with configurable workers
- Automatic debugging of failing experiment nodes
- Progressive refinement through iterative search

**Template-Free Approach:**
- No reliance on pre-defined paper templates
- Generalizes across different Machine Learning domains
- Designed for open-ended scientific exploration
- Lower success rate than v1 but broader applicability

**Full Research Pipeline:**
1. **Ideation:** LLM-brainstormed research ideas with novelty checking via Semantic Scholar
2. **Experimentation:** Autonomous code generation and execution with CUDA support
3. **Analysis:** Results interpretation and visualization
4. **Writeup:** Complete paper generation with citations and formatting
5. **Review:** Automated peer review simulation

**Model Flexibility:**
- **OpenAI Models:** GPT-4o, o1-preview, o3-mini for different stages
- **Claude Models:** Via AWS Bedrock for experimentation
- **Gemini Models:** Supported through OpenAI API compatibility
- Configurable per pipeline stage (experiment, writeup, citation, review)

### Technical Details

**Requirements:**
- Linux with NVIDIA GPU (CUDA support)
- Python 3.11
- PyTorch with CUDA
- PDF and LaTeX tools (poppler, chktex)
- ~$15-20 per experiment run (Claude 3.5 Sonnet)

**Installation:**
```bash
conda create -n ai_scientist python=3.11
conda activate ai_scientist
conda install pytorch torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia
conda install anaconda::poppler
conda install conda-forge::chktex
pip install -r requirements.txt
```

**Typical Workflow:**
```bash
# Step 1: Generate research ideas
python ai_scientist/perform_ideation_temp_free.py \
 --workshop-file "ai_scientist/ideas/my_topic.md" \
 --model gpt-4o-2024-05-13 \
 --max-num-generations 20

# Step 2: Run full experiment pipeline
python launch_scientist_bfts.py \
 --load_ideas "ai_scientist/ideas/my_topic.json" \
 --model_writeup o1-preview-2024-09-12 \
 --model_citation gpt-4o-2024-11-20 \
 --model_review gpt-4o-2024-11-20
```

**Cost Estimates:**
- Ideation: A few dollars (depends on LLM and generations)
- Main experiment: ~$15-20 (Claude 3.5 Sonnet)
- Writing phase: ~$5 additional
- Total: ~$20-25 per complete paper

### v1 vs v2 Comparison

| Aspect | AI-Scientist-v1 | AI-Scientist-v2 |
|--------|-----------------|-----------------|
| Template | Human-authored | None (template-free) |
| Domain | Specific ML tasks | Generalizes across ML |
| Success Rate | Higher | Lower (more exploratory) |
| Best For | Clear objectives | Open-ended research |
| Search Method | Linear pipeline | Agentic tree search |

### Use Cases

**Research Automation:**
- Rapid prototyping of ML research ideas
- Exploring multiple hypotheses in parallel
- Generating baseline experiments for new domains

**Educational:**
- Understanding automated research workflows
- Learning about agentic AI systems
- Studying AI-driven scientific methodology

**Important Considerations:**

**⚠️ Safety & Ethics:**
- Code executes LLM-written code with full autonomy
- Risks include dangerous packages, web access, unintended processes
- **Must run in sandboxed environment (Docker recommended)**
- Legally bound to disclose AI use in resulting manuscripts

**Mandatory Disclosure:**
Any paper generated must include attribution such as:
> "This manuscript was autonomously generated using [The AI Scientist](https://github.com/SakanaAI/AI-Scientist)."

### Why It Matters

AI-Scientist-v2 represents a significant milestone in automated scientific discovery. It has already produced a workshop-level paper accepted through peer review — a first for fully AI-generated research.

The shift from template-based (v1) to template-free (v2) approach mirrors the evolution from narrow AI to more general autonomous systems. While success rates are lower, the ability to explore open-ended research questions without human scaffolding is a notable advancement.

**Tradeoffs to Consider:**
- **Autonomy vs. Control:** Full automation means less human oversight
- **Cost:** ~$20-25 per paper is affordable for labs but adds up
- **Success Rate:** Not all experiments complete successfully
- **Safety:** Running autonomous code requires careful sandboxing

### Repository & Resources

- [SakanaAI/AI-Scientist-v2](https://github.com/SakanaAI/AI-Scientist-v2)
- [Paper](https://pub.sakana.ai/ai-scientist-v2/paper)
- [Blog Post](https://sakana.ai/ai-scientist-first-publication/)
- [ICLR2025 Workshop Experiment](https://github.com/SakanaAI/AI-Scientist-ICLR2025-Workshop-Experiment)
- [Original AI-Scientist-v1](https://github.com/SakanaAI/AI-Scientist)

---

*Posted from GitHub Trending #3 - Autonomous AI research system*
