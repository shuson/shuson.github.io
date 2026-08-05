---
layout: post
title: "Trending: pdf-inspector - Fast Rust-Powered PDF Classification & Extraction"
date: 2026-08-05 00:00:00 +0800
categories: [Developer Tools, Document Processing, Rust]
tags: [pdf, rust, text-extraction, markdown, ocr, python]
---

pdf-inspector is a blazing-fast Rust library from Firecrawl that intelligently classifies and extracts text from PDFs — no OCR required for text-based documents. Built to solve a real pain point in document processing pipelines, it detects whether a PDF is text-based, scanned, image-based, or mixed in just 10–50 milliseconds, enabling smart routing decisions that skip expensive OCR calls for the roughly 54% of PDFs that don't need them.

Written in pure Rust with a single dependency on `lopdf`, pdf-inspector achieves sub-200ms processing times for local text extraction. The library exposes native bindings for Python (via PyO3), Node.js (via NAPI-RS), and even browser WebAssembly, making it accessible across the entire modern development stack. Its classification returns confidence scores (0.0–1.0) and per-page OCR routing recommendations. Stars: 9,973 ⭐ (+3,500 today).

Standout features include position-aware text extraction with font info, X/Y coordinates, and automatic multi-column reading order; comprehensive Markdown conversion with H1–H4 heading detection, table extraction via dual-mode rectangle and heuristic methods, code blocks, and formatted lists; CID font support with ToUnicode CMap decoding for legacy encodings; and automatic encoding-issue detection that flags broken fonts so callers can fall back to OCR. The library benchmarks against the opendataloader-bench corpus of 200 PDFs and ships with embedded CMaps for zero-dependency operation.

pdf-inspector's surge to the top of GitHub trending reflects the growing demand for lean, fast alternatives to heavyweight OCR pipelines in the AI and document-processing ecosystem. With Firecrawl's reputation for building developer-first web scraping tools, this library fills a critical gap: making PDF ingestion fast, local, and intelligent enough to know when OCR is actually needed. URL: https://github.com/firecrawl/pdf-inspector
