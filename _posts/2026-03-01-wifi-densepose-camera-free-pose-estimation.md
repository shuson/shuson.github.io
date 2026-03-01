---
layout: post
title: "WiFi DensePose: Camera-Free Human Pose Estimation Using WiFi Signals"
tags:
    - machine-learning
    - rust
    - privacy
    - iot
    - github-trending
---

Today's top trending repo on GitHub is [WiFi DensePose](https://github.com/ruvnet/wifi-densepose), a cutting-edge system that uses WiFi signals instead of cameras to detect and track human body poses in real-time — enabling privacy-preserving motion tracking through walls.

## What is WiFi DensePose?

WiFi DensePose is a human pose estimation system that leverages **Channel State Information (CSI)** from commodity WiFi routers to detect body keypoints, track multiple people, and recognize activities — all without cameras. By analyzing how WiFi signals bounce off human bodies, the system can reconstruct full-body poses with sub-50ms latency.

Think of it as **computer vision without cameras** — your WiFi router becomes a privacy-preserving sensor that can see through walls, detect falls, monitor breathing, and track movement without recording any visual data.

## Key Features

### 🔒 Privacy-First Sensing

- **No cameras required** — Uses WiFi signals instead of optical sensors
- **Works through walls** — Detects motion and poses in adjacent rooms
- **No visual recording** — Cannot capture faces, clothing, or identifiable features
- **Ideal for sensitive spaces** — Bathrooms, bedrooms, healthcare facilities

### ⚡ Real-Time Performance

- **30 FPS pose estimation** — Smooth, real-time tracking
- **Sub-50ms latency** — Responsive enough for interactive applications
- **Multi-person tracking** — Simultaneously tracks up to 10 individuals
- **Rust implementation** — 810x faster than the original Python version

### 🏥 Domain-Specific Applications

| Domain | Use Case |
|--------|----------|
| **Healthcare** | Fall detection, breathing monitoring, elderly care |
| **Fitness** | Form correction, rep counting, workout tracking |
| **Smart Home** | Occupancy detection, gesture control, presence sensing |
| **Security** | Intruder detection, perimeter monitoring |
| **Disaster Response** | Survivor localization through rubble (WiFi-Mat module) |

## How It Works

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   WiFi Router   │    │   WiFi Router   │    │   WiFi Router   │
│   (CSI Source)  │    │   (CSI Source)  │    │   (CSI Source)  │
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌─────────────▼─────────────┐
                    │     CSI Data Collector    │
                    │   (Hardware Interface)    │
                    └─────────────┬─────────────┘
                                  │
                    ┌─────────────▼─────────────┐
                    │    Signal Processor       │
                    │  (Phase Sanitization)     │
                    └─────────────┬─────────────┘
                                  │
                    ┌─────────────▼─────────────┐
                    │   Neural Network Model    │
                    │    (DensePose Head)       │
                    └─────────────┬─────────────┘
                                  │
                    ┌─────────────▼─────────────┐
                    │   Person Tracker          │
                    │  (Multi-Object Tracking)  │
                    └─────────────┬─────────────┘
                                  │
          ┌───────────────────────┼───────────────────────┐
          │                       │                       │
┌─────────▼─────────┐   ┌─────────▼─────────┐   ┌─────────▼─────────┐
│   REST API        │   │  WebSocket API    │   │   Analytics       │
│  (CRUD Operations)│   │ (Real-time Stream)│   │  (Fall Detection) │
└───────────────────┘   └───────────────────┘   └───────────────────┘
```

### The Science Behind It

WiFi signals are affected by objects in their path, including human bodies. When a person moves, they create subtle changes in the **Channel State Information (CSI)** — fine-grained measurements of how WiFi signals propagate through space.

WiFi DensePose uses advanced signal processing to:

1. **Extract CSI data** from commodity WiFi hardware (ESP32 mesh, Intel 5300 NIC, or even standard WiFi via RSSI)
2. **Sanitize phase data** to remove hardware-specific noise and offsets
3. **Feed processed signals** into a neural network trained to map CSI patterns to body keypoints
4. **Track multiple people** across frames using multi-object tracking algorithms

## Hardware Requirements

| Option | Hardware | Cost | Capabilities |
|--------|----------|------|-------------|
| **ESP32 Mesh** (recommended) | 3-6x ESP32-S3 boards + consumer WiFi router | ~$54 | Presence, motion, respiration detection |
| **Research NIC** | Intel 5300 or Atheros AR9580 (discontinued) | ~$50-100 | Full CSI with 3x3 MIMO |
| **Commodity WiFi** | Any Linux laptop with WiFi | $0 | Presence and coarse motion only (RSSI-based) |

For most users, the **ESP32-S3 mesh** provides the best balance of cost and capability. The system includes deterministic reference signals for testing without hardware.

## Quick Start

### Installation (Rust — Recommended)

```bash
# Clone the repository
git clone https://github.com/ruvnet/wifi-densepose.git
cd wifi-densepose

# Run the guided installer (auto-detects your hardware)
./install.sh

# Or install a specific profile
./install.sh --profile rust --yes
```

### Basic Usage

```python
from wifi_densepose import WiFiDensePose

# Initialize with default configuration
system = WiFiDensePose()

# Start pose estimation
system.start()

# Get latest pose data
poses = system.get_latest_poses()
print(f"Detected {len(poses)} persons")

# Stop the system
system.stop()
```

### REST API

```bash
# Start the API server
wifi-densepose start

# Access the interactive docs
open http://localhost:8000/docs
```

### Real-Time Streaming

```python
import asyncio
import websockets
import json

async def stream_poses():
    uri = "ws://localhost:8000/ws/pose/stream"
    async with websockets.connect(uri) as websocket:
        while True:
            data = await websocket.recv()
            poses = json.loads(data)
            print(f"Received poses: {len(poses['persons'])} persons detected")

asyncio.run(stream_poses())
```

## WiFi-Mat: Disaster Response Module

A specialized extension for **search and rescue operations** detects and localizes survivors trapped in rubble, earthquakes, and natural disasters:

- **Vital Signs Detection** — Breathing (4-60 BPM), heartbeat via micro-Doppler
- **3D Localization** — Position estimation through debris up to 5m depth
- **START Triage** — Automatic Immediate/Delayed/Minor/Deceased classification
- **Real-time Alerts** — Priority-based notifications with escalation

This module could be deployed by first responders to locate survivors without sending rescue workers into unstable structures.

## Performance Benchmarks

The Rust implementation (v2) delivers massive speedups over the original Python version:

| Operation | Python (v1) | Rust (v2) | Speedup |
|-----------|-------------|-----------|---------|
| CSI Preprocessing | ~5ms | **5.19 µs** | ~1000x |
| Phase Sanitization | ~3ms | **3.84 µs** | ~780x |
| Feature Extraction | ~8ms | **9.03 µs** | ~890x |
| Motion Detection | ~1ms | **186 ns** | ~5400x |
| **Full Pipeline** | ~15ms | **18.47 µs** | ~810x |

The Rust version achieves **~54,000 fps** throughput with 100% test coverage across 313 tests.

## Why It Matters

WiFi DensePose represents a paradigm shift in motion sensing:

1. **Privacy preservation** — Monitor spaces without invasive cameras
2. **All-weather operation** — Works in darkness, smoke, and through obstacles
3. **Low-cost deployment** — Uses existing or inexpensive hardware
4. **Healthcare applications** — Enable elderly monitoring without compromising dignity
5. **Disaster response** — Locate survivors where cameras can't reach

The technology bridges the gap between computer vision and RF sensing, opening new possibilities for ambient intelligence that respects privacy.

## Getting Started

- **Documentation:** [GitHub Wiki](https://github.com/ruvnet/wifi-densepose#readme)
- **ESP32 Setup Guide:** [ADR-012](https://github.com/ruvnet/wifi-densepose/blob/main/docs/adr/ADR-012-esp32-csi-sensor-mesh.md)
- **WiFi-Mat User Guide:** [Disaster Response Module](https://github.com/ruvnet/wifi-densepose/blob/main/docs/wifi-mat-user-guide.md)
- **PyPI Package:** `pip install wifi-densepose`
- **Docker:** `docker pull ruvnet/wifi-densepose`

---

**Explore the project:** [github.com/ruvnet/wifi-densepose](https://github.com/ruvnet/wifi-densepose)
