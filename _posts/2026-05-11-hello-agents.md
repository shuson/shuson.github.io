---
layout: post
title: "GitHub Trending #1: Hello-Agents —— 从零构建 AI Native Agent 的系统教程"
date: 2026-05-11 08:15:48 +0800
categories: [github-trending, daily, agent, llm]
tags: [agent, llm, rag, tutorial, datawhale, python, reinforcement-learning, mcp, a2a]
---

**Repository:** [datawhalechina/hello-agents](https://github.com/datawhalechina/hello-agents)  
**Stars:** 46,461 ⭐ (+748 today)  
**Forks:** 5,596 🍴  
**Language:** Python  
**Topics:** `agent` `llm` `rag` `tutorial`

---

## 🎯 项目亮点

**Hello-Agents** 是 Datawhale 社区出品的**开源免费**智能体系统教程，今日登顶 GitHub Trending #1。项目定位清晰：**AI Native Agent**（真正以 AI 驱动的智能体），区别于 Dify/Coze/n8n 这类流程驱动的"软件工程类 Agent"。

核心理念：**穿透框架表象，从原理到实践，掌握 Agent 构建能力。**

---

## 📚 技术架构与内容体系

项目采用**五大部分、十六章节**的递进式结构，覆盖从理论到实战的完整链路：

### 第一部分：基础理论与演进（Chapter 1-3）
- **智能体定义与范式**：从符号主义到 LLM 驱动，梳理 Agent 发展史
- **LLM 基础**：Transformer 架构、Prompt Engineering、主流模型（Qwen 等）及局限性
- **配套代码**：`BPE.py`、`N_gram.py`、`Transformer.py`、`Qwen.py` — 手写实现核心组件

### 第二部分：构建 LLM Agent（Chapter 4-7）⭐ 核心实践
- **经典范式手把手实现**：
  - `ReAct.py`：推理-行动循环（Reasoning + Acting）
  - `Plan_and_solve.py`：规划求解范式
  - `Reflection.py`：反思优化机制
- **低代码平台对比**：Coze、Dify、n8n 实战（含配置文件与导出模板）
- **主流框架应用**：
  - `AutoGenDemo/`：多智能体协作（软件团队模拟）
  - `AgentScopeDemo/`：角色扮演与结构化输出
  - `Langgraph/`：图结构对话系统
- **自研框架 HelloAgents**（Chapter 7）：
  - `my_simple_agent.py` → `my_react_agent.py` → `my_advanced_search.py`
  - 基于 OpenAI 原生 API，**从零构建**完整 Agent 框架
  - 包含 LLM 封装、工具集成、上下文管理

### 第三部分：高级技术扩展（Chapter 8-12）🔥 技术深度
- **记忆与检索系统**（Chapter 8）：
  - `01_MemoryTool_Basic_Operations.py`：工作记忆实现
  - `04_RAGTool_MarkItDown_Pipeline.py`：RAG 完整流水线
  - `06_Memory_Consolidation_Demo.py`：记忆巩固机制
  - 支持多种存储后端，实现智能体的"长期记忆"
  
- **上下文工程**（Chapter 9）：
  - `01_context_builder_basic.py`：上下文动态构建
  - `06_three_day_workflow.py`：持续交互的情境理解
  - 配套 `codebase/` 模块化设计（api_client、data_processor、models）

- **智能体通信协议**（Chapter 10）💡 **前沿技术**：
  - **MCP（Model Context Protocol）**：`01_TestConnect.py` → `05_UseMCPToolInAgent.py`
    - 实现 GitHub MCP、自定义 Weather MCP Server（含 Docker 部署）
  - **A2A（Agent-to-Agent）**：`07_SimpleA2AAgent.py` → `10_AgentNegotiation.py`
    - 多智能体协商、客户服务场景实战
  - **ANP（Agent Network Protocol）**：`11_ANPInit.py` → `13_ANPLoadBalancing.py`
    - 任务分发与负载均衡

- **Agentic 强化学习**（Chapter 11）🚀 **训练实战**：
  - 从 SFT（Supervised Fine-Tuning）到 GRPO（Group Relative Policy Optimization）
  - `01_dataset_loading.py` → `05_grpo_training.py` → `08_distributed_training.py`
  - 支持 DeepSpeed ZeRO-2/3、多 GPU DDP 分布式训练
  - 包含奖励函数设计、完整训练流水线

- **性能评估体系**（Chapter 12）：
  - **BFCL v4**（Berkeley Function-Calling Leaderboard）：`02_bfcl_quick_start.py`
  - **GAIA Benchmark**：`05_gaia_quick_start.py`
  - 自建评估框架：`07_data_generation_complete_flow.py`（AIME 数据生成 + LLM Judge + Win Rate）

### 第四部分：综合案例进阶（Chapter 13-15）🎮 真实应用
- **智能旅行助手**（Chapter 13）：
  - 全栈项目：`helloagents-trip-planner/`（Vue 3 + FastAPI）
  - 多智能体协作：POI 搜索、路线规划、地图服务集成（高德 API）
  
- **自动化深度研究 Agent**（Chapter 14）：
  - `helloagents-deepresearch/`：复现 DeepResearch 架构
  - 模块化设计：`planner.py`（规划） + `search.py`（搜索） + `summarizer.py`（总结） + `reporter.py`（报告）
  - 支持笔记管理、工具事件追踪

- **赛博小镇模拟**（Chapter 15）🌟 **创新案例**：
  - `Helloagents-AI-Town/`：基于 **Godot 引擎**的多智能体社会模拟
  - 后端（Python）：NPC AI、关系管理、记忆系统（SQLite）、状态管理
  - 前端（Godot）：可视化交互、对话 UI、BGM/音效
  - 实现智能体间的** affinity 系统**、**对话日志**、**长期记忆**

### 第五部分：毕业设计与展望（Chapter 16）
- 社区共创项目展示（`Co-creation-projects/`）
- 完整多智能体应用构建指南

---

## 🛠️ 技术栈与工具链

| 技术领域 | 工具/框架 | 应用场景 |
|---------|----------|---------|
| **Agent 框架** | AutoGen, AgentScope, LangGraph, HelloAgents（自研） | 多智能体协作、任务编排 |
| **LLM 接口** | OpenAI API, Qwen | 模型调用、推理 |
| **协议标准** | MCP, A2A, ANP | 智能体间通信 |
| **记忆系统** | RAG (MarkItDown), MemoryTool | 长期记忆、知识检索 |
| **训练框架** | PyTorch, Transformers, DeepSpeed | SFT, GRPO, 分布式训练 |
| **评估基准** | BFCL v4, GAIA, 自建 AIME | 性能评估、数据生成 |
| **前端技术** | Vue 3, Vite, Godot | Web 应用、游戏模拟 |
| **后端技术** | FastAPI, SQLite | API 服务、数据存储 |

---

## 💡 核心创新点

1. **AI Native 定位**：区别于低代码平台，强调从原理构建真正以 AI 驱动的 Agent
2. **完整训练链路**：覆盖从 SFT 到 GRPO 的强化学习训练（Chapter 11）
3. **协议层深度实践**：MCP/A2A/ANP 三大协议均有代码实现（Chapter 10）
4. **游戏化应用场景**：用 Godot 引擎构建"赛博小镇"，创新智能体社会模拟
5. **评估体系自建**：不仅用 Benchmark，还提供数据生成 + LLM Judge + Win Rate 的完整评估工具链

---

## 📈 社区生态

- **Extra-Chapter 精选**：社区贡献的面试问题、Dify 保姆级教程、GUI Agent 实战、Agent Skills 与 MCP 对比等
- **PDF 版本**：提供带水印的开源 PDF（防止倒卖），支持国内加速下载
- **问卷反馈**：规划下一阶段《从零开始训练智能体》项目

---

## 🎓 适合人群

- **AI 开发者**、**软件工程师**：想掌握 Agent 构建能力的从业者
- **在校学生**：对前沿 AI 技术感兴趣的学习者
- **自学者**：具备 Python 基础，了解 LLM 基本概念

---

## 🚀 快速开始

```bash
# 在线阅读（国内加速）
https://hello-agents.datawhale.cc

# 国外访问
https://datawhalechina.github.io/hello-agents/

# 克隆仓库
git clone https://github.com/datawhalechina/hello-agents.git
cd hello-agents
```

---

## 📊 今日趋势数据

- **GitHub Stars**：46,461（今日 +748）
- **Forks**：5,596
- **仓库大小**：202,530 KB（约 200 MB，包含完整代码与文档）
- **创建时间**：2025-09-07
- **最后更新**：2026-05-11（今日）

---

**总结**：Hello-Agents 不仅是一本教程，更是一个**完整的 Agent 技术生态**。从 Transformer 原理到强化学习训练，从 MCP 协议到 Godot 游戏开发，覆盖了 AI Native Agent 的全技术栈。对于想深入理解并动手构建智能体的开发者，这是目前 GitHub 上**最系统、最实战**的中文开源教程。

