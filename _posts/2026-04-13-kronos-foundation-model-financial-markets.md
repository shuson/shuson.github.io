---
layout: post
title: "Kronos - First Open-Source Foundation Model for Financial Market Forecasting"
date: 2026-04-13
categories: [AI, Finance, Machine Learning, Open Source]
tags: [kronos, financial-ai, time-series, forecasting, foundation-model, quantitative-trading]
---

## 🚀 Kronos

**shiyu-coder/Kronos** is the #2 trending repo on GitHub today with over **15,738 stars** and **1,985 stars gained in 24 hours**. It's the **first open-source foundation model** specifically designed for financial candlesticks (K-lines), trained on data from over **45 global exchanges**.

### What It Is

Kronos is a family of decoder-only foundation models pre-trained for the "language" of financial markets — K-line sequences (OHLCV data). Unlike general-purpose time-series models, Kronos handles the unique high-noise characteristics of financial data through a novel two-stage framework:

1. **Specialized Tokenizer** — Quantizes continuous, multi-dimensional K-line data into hierarchical discrete tokens
2. **Autoregressive Transformer** — Pre-trained on these tokens to serve as a unified model for diverse quantitative tasks

The result: a model that can forecast price movements, volume, and trading amounts across stocks, crypto, and other financial instruments.

### Key Features

**Market-Language Understanding** — Trained specifically on financial candlestick patterns, not generic time-series data.

**Multi-Exchange Coverage** — Learning from 45+ global exchanges means robust cross-market generalization.

**Probabilistic Forecasting** — Generate multiple forecast paths with configurable temperature sampling for risk assessment.

**Flexible Model Sizes** — From 4.1M params (Kronos-mini) to 499.2M params (Kronos-large) for different compute budgets.

**Fine-Tuning Pipeline** — Complete scripts to adapt Kronos to your own market data (A-Share example included).

### Model Zoo

| Model | Tokenizer | Context Length | Parameters | Available |
|-------|-----------|----------------|------------|-----------|
| Kronos-mini | Kronos-Tokenizer-2k | 2048 | 4.1M | ✅ Hugging Face |
| Kronos-small | Kronos-Tokenizer-base | 512 | 24.7M | ✅ Hugging Face |
| Kronos-base | Kronos-Tokenizer-base | 512 | 102.3M | ✅ Hugging Face |
| Kronos-large | Kronos-Tokenizer-base | 512 | 499.2M | ❌ Not yet |

### Quick Start

```bash
# Install dependencies
pip install -r requirements.txt

# Load model from Hugging Face
python -c "
from model import Kronos, KronosTokenizer, KronosPredictor

tokenizer = KronosTokenizer.from_pretrained('NeoQuasar/Kronos-Tokenizer-base')
model = Kronos.from_pretrained('NeoQuasar/Kronos-small')
predictor = KronosPredictor(model, tokenizer, max_context=512)
"
```

### Making Forecasts

```python
import pandas as pd
from model import Kronos, KronosTokenizer, KronosPredictor

# Load model
tokenizer = KronosTokenizer.from_pretrained("NeoQuasar/Kronos-Tokenizer-base")
model = Kronos.from_pretrained("NeoQuasar/Kronos-small")
predictor = KronosPredictor(model, tokenizer, max_context=512)

# Load your data (must have open, high, low, close columns)
df = pd.read_csv("./data/XSHG_5min_600977.csv")
df['timestamps'] = pd.to_datetime(df['timestamps'])

# Define context window and prediction length
lookback = 400
pred_len = 120

# Prepare inputs
x_df = df.loc[:lookback-1, ['open', 'high', 'low', 'close', 'volume', 'amount']]
x_timestamp = df.loc[:lookback-1, 'timestamps']
y_timestamp = df.loc[lookback:lookback+pred_len-1, 'timestamps']

# Generate predictions
pred_df = predictor.predict(
    df=x_df,
    x_timestamp=x_timestamp,
    y_timestamp=y_timestamp,
    pred_len=pred_len,
    T=1.0,          # Temperature for sampling
    top_p=0.9,      # Nucleus sampling probability
    sample_count=1  # Number of forecast paths to average
)

print(pred_df.head())
```

### Batch Prediction

For forecasting multiple assets simultaneously:

```python
# Prepare multiple datasets
df_list = [df1, df2, df3]
x_timestamp_list = [x_ts1, x_ts2, x_ts3]
y_timestamp_list = [y_ts1, y_ts2, y_ts3]

# Batch prediction (GPU parallelized)
pred_df_list = predictor.predict_batch(
    df_list=df_list,
    x_timestamp_list=x_timestamp_list,
    y_timestamp_list=y_timestamp_list,
    pred_len=pred_len,
    T=1.0,
    top_p=0.9,
    sample_count=1,
    verbose=True
)
```

### Fine-Tuning Pipeline

Kronos includes a complete fine-tuning pipeline for custom markets (e.g., A-Share):

```bash
# Step 1: Configure paths in finetune/config.py
# Step 2: Preprocess Qlib data
python finetune/qlib_data_preprocess.py

# Step 3a: Fine-tune tokenizer
torchrun --standalone --nproc_per_node=2 finetune/train_tokenizer.py

# Step 3b: Fine-tune predictor
torchrun --standalone --nproc_per_node=2 finetune/train_predictor.py

# Step 4: Backtest
python finetune/qlib_test.py --device cuda:0
```

### Live Demo

Check out the **live demo** forecasting BTC/USDT over the next 24 hours:

👉 [Kronos Live Demo](https://shiyu-coder.github.io/Kronos-demo/)

### Research & Citation

Kronos has been **accepted by AAAI 2026**. The paper is available on [arXiv](https://arxiv.org/abs/2508.02739).

```bibtex
@misc{shi2025kronos,
  title={Kronos: A Foundation Model for the Language of Financial Markets},
  author={Yu Shi and Zongliang Fu and Shuo Chen and Bohan Zhao and Wei Xu and Changshui Zhang and Jian Li},
  year={2025},
  eprint={2508.02739},
  archivePrefix={arXiv},
  primaryClass={q-fin.ST}
}
```

### Why It Matters

Kronos brings **foundation model capabilities to quantitative finance**. Instead of training separate models for each asset or market, you get a pre-trained model that understands financial market dynamics out of the box. Fine-tune it on your specific market for even better results.

Potential applications:

- **Price forecasting** — Predict future OHLCV values
- **Risk assessment** — Generate probabilistic forecast distributions
- **Strategy backtesting** — Test trading strategies on model predictions
- **Cross-market analysis** — Leverage learnings from 45+ exchanges

---

**Repo:** [shiyu-coder/Kronos](https://github.com/shiyu-coder/Kronos)  
**Stars:** 15,738+ (1,985 today)  
**License:** MIT  
**Models:** [Hugging Face @NeoQuasar](https://huggingface.co/NeoQuasar)  
**Demo:** [Live Forecast Demo](https://shiyu-coder.github.io/Kronos-demo/)  
**Paper:** [arXiv:2508.02739](https://arxiv.org/abs/2508.02739)
