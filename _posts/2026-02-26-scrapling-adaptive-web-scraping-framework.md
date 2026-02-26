---
layout: post
title: "Scrapling: An Adaptive Web Scraping Framework That Survives Website Changes"
tags:
    - web-scraping
    - python
    - automation
    - github-trending
---

Today's top trending repo on GitHub is [Scrapling](https://github.com/D4Vinci/Scrapling), an adaptive web scraping framework that handles everything from single requests to full-scale crawls — and automatically adapts when websites change their structure.

## What is Scrapling?

Scrapling is a Python web scraping library built by web scrapers, for web scrapers. Its standout feature is **adaptive parsing** — the parser learns from website changes and automatically relocates your elements when pages update, so your scrapers don't break every time a site redesigns.

## Key Features

### 🕷️ Full Crawling Framework

- **Scrapy-like API** — Define spiders with `start_urls`, async parse callbacks, and Request/Response objects
- **Concurrent crawling** — Configurable concurrency limits and per-domain throttling
- **Multi-session support** — Mix HTTP requests and stealthy headless browsers in a single spider
- **Pause & resume** — Checkpoint-based persistence; press Ctrl+C and resume later
- **Streaming mode** — Stream items as they arrive with real-time stats

### 🛡️ Anti-Bot Bypass

- **Stealth mode** — Bypasses Cloudflare Turnstile and other anti-bot systems out of the box
- **Fingerprint spoofing** — Impersonates browser TLS fingerprints, headers, and HTTP/3
- **Proxy rotation** — Built-in proxy rotator with cyclic or custom strategies
- **Blocked request detection** — Automatic retry of blocked requests

### 🔄 Adaptive Scraping

- **Smart element tracking** — Relocate elements after website changes using similarity algorithms
- **Multiple selection methods** — CSS, XPath, text search, regex, and BeautifulSoup-style filters
- **Find similar elements** — Automatically locate elements similar to ones you've already found
- **Auto selector generation** — Generate robust CSS/XPath selectors for any element

### ⚡ High Performance

Scrapling is blazing fast — benchmarks show it outperforms most Python scraping libraries:

| Library | Time (ms) | vs Scrapling |
|---------|-----------|--------------|
| Scrapling | 2.02 | 1.0x |
| Parsel/Scrapy | 2.04 | 1.01x |
| BS4 with Lxml | 1584.31 | ~784x |
| BS4 with html5lib | 3391.91 | ~1679x |

## Quick Start

### Basic Usage

```python
from scrapling.fetchers import Fetcher, StealthyFetcher

# Simple HTTP request
page = Fetcher.get('https://quotes.toscrape.com/')
quotes = page.css('.quote .text::text').getall()

# Stealth mode with Cloudflare bypass
StealthyFetcher.adaptive = True
page = StealthyFetcher.fetch('https://example.com', headless=True, solve_cloudflare=True)
products = page.css('.product', auto_save=True)  # Survives design changes!
```

### Building a Spider

```python
from scrapling.spiders import Spider, Response

class QuotesSpider(Spider):
    name = "quotes"
    start_urls = ["https://quotes.toscrape.com/"]
    concurrent_requests = 10

    async def parse(self, response: Response):
        for quote in response.css('.quote'):
            yield {
                "text": quote.css('.text::text').get(),
                "author": quote.css('.author::text').get(),
            }
        
        next_page = response.css('.next a')
        if next_page:
            yield response.follow(next_page[0].attrib['href'])

result = QuotesSpider().start()
result.items.to_json("quotes.json")
```

### Pause & Resume Long Crawls

```python
QuotesSpider(crawldir="./crawl_data").start()
# Press Ctrl+C to pause — progress is saved automatically
# Restart with same crawldir to resume where you left off
```

## Installation

```bash
pip install scrapling
```

For full features including fetchers and browser automation:

```bash
pip install "scrapling[all]"
scrapling install  # Downloads browsers and dependencies
```

Docker image is also available:

```bash
docker pull pyd4vinci/scrapling
```

## Why It Matters

Web scraping is notoriously fragile — a single class name change can break your entire scraper. Scrapling's adaptive approach means:

1. **Less maintenance** — Scrapers survive website redesigns
2. **Better reliability** — Automatic element relocation when structures change
3. **All-in-one solution** — From simple requests to distributed crawls
4. **Production-ready** — 92% test coverage, full type hints, battle-tested by hundreds of scrapers

## Additional Tools

- **Interactive shell** — Built-in IPython shell with Scrapling integration for rapid development
- **CLI tools** — Scrape URLs directly from terminal without writing code
- **MCP Server** — AI-assisted web scraping with built-in Model Context Protocol server for Claude/Cursor

---

**Explore the project:** [github.com/D4Vinci/Scrapling](https://github.com/D4Vinci/Scrapling)

**Documentation:** [scrapling.readthedocs.io](https://scrapling.readthedocs.io/)

**Discord community:** [Join the server](https://discord.gg/EMgGbDceNQ)
