---
layout: post
title: "Claude Scientific Skills - 170+ AI Agent Skills for Research & Science"
date: 2026-03-04
categories: [AI, Agents, Research]
tags: [agent-skills, scientific-computing, bioinformatics, research, AI-agents, cursor, claude-code]
---

## 🔬 Claude Scientific Skills

**Claude Scientific Skills** is a comprehensive collection of 170+ ready-to-use scientific and research skills for AI agents, created by [K-Dense](https://k-dense.ai). Following the open [Agent Skills](https://agentskills.io/) standard, it transforms your AI coding agent into an "AI Scientist" capable of executing complex multi-step scientific workflows across biology, chemistry, medicine, and beyond.

Works with **Cursor**, **Claude Code**, **Codex**, and any agent supporting the Agent Skills standard.

### What's Included

The repository provides access to **250+ databases and data sources** through curated skills:

**🧬 Bioinformatics & Genomics**
- Sequence analysis, single-cell RNA-seq, gene regulatory networks
- Variant annotation, phylogenetic analysis
- Access to PubMed, UniProt, COSMIC, ClinicalTrials.gov via BioServices (~40 bioinformatics services) and BioPython (38 NCBI sub-databases)

**🧪 Cheminformatics & Drug Discovery**
- Molecular property prediction, virtual screening, ADMET analysis
- Molecular docking, lead optimization
- ChEMBL integration for compound data

**🏥 Clinical Research & Precision Medicine**
- Clinical trials data, pharmacogenomics, variant interpretation
- Drug safety analysis, clinical decision support, treatment planning

**🧠 Healthcare AI & Clinical ML**
- EHR analysis, physiological signal processing
- Medical imaging, clinical prediction models

**🖼️ Medical Imaging & Digital Pathology**
- DICOM processing, whole slide image analysis
- Computational pathology, radiology workflows

**🤖 Machine Learning & AI**
- Deep learning, reinforcement learning, time series analysis
- Model interpretability, Bayesian methods
- Optimized skills for PyTorch Lightning, scikit-learn, scVelo, TimesFM

**🔮 Materials Science & Chemistry**
- Crystal structure analysis, phase diagrams
- Metabolic modeling, computational chemistry
- OpenMM, MDAnalysis for molecular dynamics

**🌌 Physics & Astronomy**
- Astronomical data analysis, coordinate transformations
- Cosmological calculations, symbolic mathematics
- PennyLane, Qiskit for quantum computing

**📊 Data Analysis & Visualization**
- Statistical analysis, network analysis, time series
- Publication-quality figures, large-scale data processing
- Exploratory data analysis (EDA) pipelines

**📚 Scientific Communication**
- Literature review, peer review assistance, scientific writing
- Document processing, posters, slides, schematics
- Citation management via pyzotero

**🔬 Laboratory Automation**
- Liquid handling protocols, lab equipment control
- Workflow automation, LIMS integration
- Benchling, DNAnexus, LatchBio, OMERO integration

### Quick Examples

**Genomics Analysis:**
```python
# Skill: gget - Access 20+ genomics databases
import gget
# Query Ensembl, GTEx, or KEGG with simple API calls
```

**Molecular Docking:**
```python
# Skill: RDKit - Molecular property prediction
from rdkit import Chem
# Compute molecular descriptors, fingerprints, similarity
```

**Single-Cell RNA-seq:**
```python
# Skill: Scanpy - Single-cell analysis pipeline
import scanpy as sc
# Preprocess, cluster, and visualize scRNA-seq data
```

### Installation

**Global Installation (recommended — skills available everywhere):**

| Tool | Directory |
|------|-----------|
| Cursor | `~/.cursor/skills/` |
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.codex/skills/` |

```bash
# Clone the repository
git clone https://github.com/K-Dense-AI/claude-scientific-skills.git

# Global install for Cursor
cp -r claude-scientific-skills/scientific-skills/* ~/.cursor/skills/

# Global install for Claude Code
cp -r claude-scientific-skills/scientific-skills/* ~/.claude/skills/
```

**Project-Level Installation (skills scoped to a single project):**

```bash
mkdir -p .cursor/skills
cp -r /path/to/claude-scientific-skills/scientific-skills/* .cursor/skills/
```

That's it! Your AI agent will automatically discover the skills and use them when relevant.

### Why Use This?

**Save Days of Work** — Skip API documentation research and integration setup

**Production-Ready Code** — Tested, validated examples following scientific best practices

**Multi-Step Workflows** — Execute complex pipelines with a single prompt

**170 Skills** — Extensive coverage across all major scientific domains

**250+ Databases** — Collective access through dedicated skills and multi-database packages

**Simple Setup** — Copy skills to your skills directory and start working

**Automatic Discovery** — Your agent automatically finds and uses relevant skills

**Well Documented** — Each skill includes examples, use cases, and best practices

### GitHub Stats

- ⭐ **Trending #2** today
- 📦 **170+ skills** across 15+ scientific domains
- 🔀 **117 forks**
- 📦 Apache 2.0 License

### Why It Matters

Claude Scientific Skills bridges the gap between general-purpose AI coding assistants and domain-specific scientific expertise. Instead of asking your agent to "figure out" how to use specialized libraries like RDKit, Scanpy, or BioPython, you give it pre-documented, battle-tested skills that encode best practices and common workflows.

This is particularly valuable for:
- **Researchers** who want AI assistance but lack deep programming expertise in every tool
- **Students** learning computational methods across multiple domains
- **Lab teams** standardizing analysis pipelines across projects
- **Interdisciplinary projects** requiring multiple scientific domains

The Agent Skills standard means these skills work across multiple AI tools — write once, use everywhere.

### Repository & Resources

- [K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills)
- [K-Dense Web Platform](https://k-dense.ai) — Hosted AI co-scientist built on these skills
- [Agent Skills Standard](https://agentskills.io/)
- [Getting Started Video](https://youtu.be/ZxbnDaD_FVg)

---

*Posted from GitHub Trending #2 - AI-related repository*
