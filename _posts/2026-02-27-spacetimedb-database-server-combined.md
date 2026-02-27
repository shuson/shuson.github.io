---
layout: post
title: "SpacetimeDB: A Database and Server Combined into One"
tags:
    - database
    - rust
    - backend
    - realtime
    - github-trending
---

Today's top trending repo on GitHub is [SpacetimeDB](https://github.com/clockworklabs/SpacetimeDB) by Clockwork Labs, a relational database system that lets you upload application logic directly into the database as "modules" — effectively combining your database and server into a single binary.

## What is SpacetimeDB?

SpacetimeDB is a relational database optimized for **maximum speed and minimum latency**, designed for real-time applications like games, chat, and collaboration tools. Instead of deploying a separate web server between your clients and database, your clients connect directly to the database and execute application logic inside the database itself.

Think of it as **smart contracts without blockchain** — you write your entire backend as stored procedures (called "modules") in Rust or C#, and SpacetimeDB handles authorization, permissions, and state management.

## Key Architecture

```
┌─────────────┐      ┌──────────────────────┐
│   Clients   │ ────►│   SpacetimeDB        │
│ (any SDK)   │      │   + Your Module      │
└─────────────┘      │   (app logic)        │
                     └──────────────────────┘
```

Unlike traditional architectures with microservices, containers, and Kubernetes, SpacetimeDB eliminates the middle layer:

- **No microservices** — All logic lives in the database
- **No containers or VMs** — Deploy as a single binary
- **No DevOps overhead** — Just upload your module and go
- **No infrastructure management** — SpacetimeDB handles it all

## How It Works

SpacetimeDB achieves its speed by holding **all application state in memory**, while persisting data in a write-ahead log (WAL) for recovery. This design enables:

- **Sub-millisecond latency** — State is always in RAM
- **Real-time synchronization** — Changes propagate instantly to connected clients
- **Automatic scaling** — Built-in concurrency and state management

The entire backend of their MMORPG [BitCraft Online](https://bitcraftonline.com) runs as a single SpacetimeDB module — every chat message, item, resource, terrain change, and player location is stored and processed by the database before being synchronized to clients in real-time.

## Supported Languages

### Server-Side (Modules)
- **Rust** — Primary language with full feature support
- **C#** — Full support for .NET developers

### Client SDKs
- **Rust**
- **C#**
- **TypeScript** — For web and Node.js clients

More languages are planned for the future.

## Quick Start

### Installation

**macOS / Linux:**
```bash
curl -sSf https://install.spacetimedb.com | sh
```

**Windows (PowerShell):**
```powershell
iwr https://windows.spacetimedb.com -useb | iex
```

**Docker:**
```bash
docker run --rm --pull always -p 3000:3000 clockworklabs/spacetime start
```

### Basic Workflow

1. **Start a SpacetimeDB node:**
   ```bash
   spacetime start
   ```

2. **Write a module** (in Rust or C#) with your application logic

3. **Upload the module:**
   ```bash
   spacetime publish my-module
   ```

4. **Connect from your client** using one of the SDKs

## Use Cases

SpacetimeDB is ideal for:

- **Multiplayer games** — Real-time state sync for all players
- **Chat applications** — Instant message delivery and presence
- **Collaboration tools** — Live document editing, whiteboards
- **IoT dashboards** — Real-time sensor data visualization
- **Trading platforms** — Low-latency order matching

## Why It Matters

The traditional backend stack has become increasingly complex: load balancers, API gateways, microservices, container orchestration, service meshes. SpacetimeDB challenges this complexity by asking: **what if your database could also be your server?**

Benefits include:

1. **Simplified architecture** — One binary, one deployment target
2. **Lower latency** — No network hops between server and database
3. **Easier development** — Write everything in one language
4. **Reduced operational overhead** — No Kubernetes, no service discovery
5. **Built-in real-time** — Clients subscribe to state changes automatically

## License

SpacetimeDB is licensed under **BSL 1.1**, which converts to **AGPL v3.0 with a linking exception** after a few years. The linking exception ensures that using SpacetimeDB doesn't force you to open-source your own application code.

## Getting Started

- **Documentation:** [spacetimedb.com/docs](https://spacetimedb.com/docs)
- **Discord community:** [Join the server](https://discord.gg/spacetimedb)
- **Website:** [spacetimedb.com](https://spacetimedb.com)
- **BitCraft Online:** See SpacetimeDB in action at [bitcraftonline.com](https://bitcraftonline.com)

---

**Explore the project:** [github.com/clockworklabs/SpacetimeDB](https://github.com/clockworklabs/SpacetimeDB)
