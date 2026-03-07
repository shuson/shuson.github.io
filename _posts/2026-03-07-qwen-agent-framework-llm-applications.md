---
layout: post
title: "Qwen-Agent - Framework for Building LLM Applications with Qwen3.5"
date: 2026-03-07
categories: [AI, Agents, Framework]
tags: [qwen, llm-framework, function-calling, agent-development, alibaba, model-context-protocol]
---

## 🤖 Qwen-Agent

**Qwen-Agent** is a framework for developing LLM applications based on the instruction following, tool usage, planning, and memory capabilities of Qwen models. Originally built to power [Qwen Chat](https://chat.qwen.ai/), it's now open-source and ready for developers to build their own AI agents.

The framework recently added support for **Qwen3.5** (February 2026), bringing enhanced reasoning, planning, and multi-turn tool execution capabilities.

### What Qwen-Agent Provides

Unlike generic agent frameworks, Qwen-Agent is purpose-built for the Qwen model family and leverages their native strengths:

- **Function Calling** — Native tool invocation with parallel and multi-step execution
- **Model Context Protocol (MCP)** — Standardized tool integration
- **Code Interpreter** — Safe code execution for data analysis and automation
- **RAG (Retrieval-Augmented Generation)** — Knowledge-grounded responses
- **Memory Management** — Conversation history and context persistence
- **Planning** — Multi-step task decomposition and execution

### Architecture Overview

Qwen-Agent offers a modular component system:

| Component | Purpose |
|-----------|---------|
| **LLMs** (`BaseChatModel`) | Model abstraction with built-in function calling |
| **Tools** (`BaseTool`) | Custom tool definitions with descriptions and parameters |
| **Agents** (`Agent`) | High-level agent orchestration |

This allows developers to mix and match components or build entirely custom agents.

### Key Features

**Multi-Model Support:**
- Qwen3.5, Qwen3, Qwen2.5 series, QwQ-32B, Qwen3-Coder
- DashScope API (Alibaba Cloud) or self-hosted via vLLM/Ollama
- OpenAI-compatible API support

**Advanced Capabilities:**
- Parallel tool calls (execute multiple tools simultaneously)
- Multi-turn tool execution (chain tools across conversation turns)
- Vision support (Qwen3-VL for image-based tool calls)
- Reasoning content field for chain-of-thought outputs

**Built-in Applications:**
- Browser Assistant — Web automation and information retrieval
- Code Interpreter — Execute Python code safely
- Custom Assistant — Configurable agent with custom tools and files

### Quick Start

```bash
# Install with optional features
pip install -U "qwen-agent[gui,rag,code_interpreter,mcp]"

# Or minimal install
pip install -U qwen-agent
```

**Basic Agent Example:**

```python
from qwen_agent.agents import Assistant

llm_cfg = {
    'model': 'qwen-max-latest',
    'model_type': 'qwen_dashscope',
    # Uses DASHSCOPE_API_KEY environment variable
}

bot = Assistant(
    llm=llm_cfg,
    function_list=['code_interpreter', 'my_custom_tool'],
    files=['./document.pdf']  # RAG from files
)

messages = [{'role': 'user', 'content': 'Analyze this PDF and summarize it'}]
for response in bot.run(messages=messages):
    print(response)
```

**Custom Tool Example:**

```python
from qwen_agent.tools.base import BaseTool, register_tool

@register_tool('my_image_gen')
class MyImageGen(BaseTool):
    description = 'AI image generation from text prompts'
    parameters = [{
        'name': 'prompt',
        'type': 'string',
        'description': 'Image description in English',
        'required': True
    }]

    def call(self, params: str, **kwargs) -> str:
        prompt = json5.loads(params)['prompt']
        return json5.dumps({
            'image_url': f'https://image.pollinations.ai/prompt/{prompt}'
        })
```

### Recent Updates (2026)

- **Feb 16** — Qwen3.5 support with enhanced agent capabilities
- **Jan 27** — DeepPlanning benchmark for agent evaluation released
- **Sep 23, 2025** — Qwen3-VL vision tool-call support (zoom, image search, web search)
- **Jul 23, 2025** — Qwen3-Coder tool-call demo with native API interface
- **May 1, 2025** — MCP (Model Context Protocol) cookbooks added

### Model Context Protocol (MCP)

Qwen-Agent supports MCP, a standardized protocol for tool integration. This means:
- Tools can be shared across different agent frameworks
- Community-contributed tools work out of the box
- Easier to build and distribute custom tools

### Self-Hosting Options

For teams preferring self-hosted models:

```bash
# vLLM deployment (high-throughput GPU)
vllm serve Qwen/Qwen2.5-7B-Instruct

# Ollama (local CPU/GPU)
ollama run qwen2.5:7b
```

Then configure Qwen-Agent to use your local endpoint:

```python
llm_cfg = {
    'model': 'Qwen2.5-7B-Instruct',
    'model_server': 'http://localhost:8000/v1',
    'api_key': 'EMPTY',
}
```

### Why It Matters

Qwen-Agent bridges the gap between powerful Qwen models and practical applications. Instead of wrestling with raw API calls, developers get:

- **Production-ready patterns** — Battle-tested agent architectures
- **Tool ecosystem** — Pre-built tools for common tasks
- **Evaluation benchmarks** — DeepPlanning for measuring agent performance
- **Documentation** — Comprehensive guides and examples

For teams already using Qwen models, this is the official framework that powers Qwen Chat itself.

### Repository & Resources

- [QwenLM/Qwen-Agent](https://github.com/QwenLM/Qwen-Agent)
- [Documentation](https://qwenlm.github.io/Qwen-Agent/en/)
- [DeepPlanning Benchmark](https://qwenlm.github.io/Qwen-Agent/en/benchmarks/deepplanning/)
- [Qwen Chat](https://chat.qwen.ai/)
- [Hugging Face](https://huggingface.co/Qwen)
- [ModelScope](https://modelscope.cn/organization/qwen)
- [Discord Community](https://discord.gg/CV4E9rpNSD)

---

*Posted from GitHub Trending #2 - AI-related repository*
