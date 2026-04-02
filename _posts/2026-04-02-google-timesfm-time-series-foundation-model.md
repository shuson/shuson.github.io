---
layout: post
title: "Google TimesFM - Time Series Foundation Model for Forecasting"
date: 2026-04-02
categories: [AI, Machine Learning, Time Series]
tags: [timesfm, google-research, time-series-forecasting, foundation-model, deep-learning]
---

## 🎯 Google TimesFM

**google-research/timesfm** is trending #3 on GitHub today with over 12,000 stars and 380+ stars gained in the last 24 hours. It's a pretrained time-series foundation model developed by Google Research for accurate forecasting across diverse domains.

### What It Is

**TimesFM** (Time Series Foundation Model) is a **decoder-only foundation model** specifically designed for time-series forecasting. Published at ICML 2024, it represents Google Research's approach to universal time-series prediction without requiring domain-specific fine-tuning.

The model is available as an open-source package (unofficial Google product) and is also integrated into [BigQuery](https://cloud.google.com/bigquery/docs/timesfm-model) as an official Google Cloud product.

### Latest Version: TimesFM 2.5

Released in September 2025, TimesFM 2.5 brings significant improvements:

| Feature | TimesFM 2.0 | TimesFM 2.5 |
|---------|-------------|-------------|
| **Parameters** | 500M | 200M (60% smaller) |
| **Context Length** | 2,048 | 16,384 (8x longer) |
| **Quantile Forecast** | Discrete | Continuous up to 1k horizon |
| **Frequency Indicator** | Required | Removed (simplified API) |

### Key Capabilities

**🔮 Zero-Shot Forecasting:**
- Pre-trained on massive diverse time-series data
- Works out-of-the-box without fine-tuning
- Handles multiple time series simultaneously

**📊 Advanced Forecasting Features:**
- Point forecasts with uncertainty quantification
- Continuous quantile forecasts (10th to 90th percentiles)
- Support for covariates via XReg integration
- Flip invariance and positive value inference

**⚡ Efficient Inference:**
- PyTorch and Flax/JAX backends
- Compiled inference for faster predictions
- Support for CPU, GPU, TPU, and Apple Silicon

### Quick Start

```bash
# Clone the repository
git clone https://github.com/google-research/timesfm.git
cd timesfm

# Install with uv (recommended)
uv venv
source .venv/bin/activate
uv pip install -e .[torch]  # or .[flax] for JAX backend

# Run a forecast
python examples/quickstart.py
```

### Code Example

```python
import torch
import numpy as np
import timesfm

torch.set_float32_matmul_precision("high")

# Load the model
model = timesfm.TimesFM_2p5_200M_torch.from_pretrained(
    "google/timesfm-2.5-200m-pytorch"
)

# Configure forecasting
model.compile(
    timesfm.ForecastConfig(
        max_context=1024,
        max_horizon=256,
        normalize_inputs=True,
        use_continuous_quantile_head=True,
    )
)

# Forecast
point_forecast, quantile_forecast = model.forecast(
    horizon=12,
    inputs=[
        np.linspace(0, 1, 100),
        np.sin(np.linspace(0, 20, 67)),
    ]
)
```

### Use Cases

**Financial Forecasting:**
- Stock price prediction
- Revenue forecasting
- Market trend analysis

**Operations & Supply Chain:**
- Demand forecasting
- Inventory optimization
- Resource planning

**IoT & Sensors:**
- Equipment failure prediction
- Energy consumption forecasting
- Environmental monitoring

**Business Metrics:**
- User growth projection
- Churn prediction
- Seasonal pattern analysis

### Why It Stands Out

**Research-Backed:**
- Published at ICML 2024 (premier ML conference)
- Peer-reviewed academic foundation
- Backed by Google Research team

**Production-Ready:**
- Available in BigQuery for enterprise use
- Multiple backend options (PyTorch, Flax)
- Active maintenance with regular updates

**Developer-Friendly:**
- Simple Python API
- Comprehensive documentation
- Example notebooks and tutorials

### Recent Updates

- **Mar 2026:** TimesFM SKILLS.md released by community contributor [@borealBytes](https://github.com/borealBytes)
- **Oct 2025:** Covariate support restored via XReg for TimesFM 2.5
- **Sep 2025:** TimesFM 2.5 release with major architectural improvements

### Repository & Resources

- [google-research/timesfm](https://github.com/google-research/timesfm)
- [Hugging Face Collection](https://huggingface.co/collections/google/timesfm-release-66e4be5fdb56e960c1e482a6)
- [Research Paper (ICML 2024)](https://arxiv.org/abs/2310.10688)
- [Google Research Blog](https://research.google/blog/a-decoder-only-foundation-model-for-time-series-forecasting/)
- [BigQuery Integration](https://cloud.google.com/bigquery/docs/timesfm-model)

---

*Posted from GitHub Trending - Google's Foundation Model for Time-Series Forecasting*
