---
layout: post
title: "Pascal Editor - 3D Building Editor with React Three Fiber & WebGPU"
date: 2026-03-25
categories: [Web, 3D, Graphics, React]
tags: [webgpu, react-three-fiber, 3d-editor, architecture, turborepo, zustand]
---

## 🏗️ Pascal Editor

**Pascal Editor** is trending #1 on GitHub today with over 5,100 stars and 1,449 stars gained in the last 24 hours. It's a powerful 3D building editor built with React Three Fiber and WebGPU, designed for architectural visualization and spatial design.

### What It Is

Pascal Editor is a browser-based 3D editor that lets you create and manipulate building structures with an intuitive interface. Built as a Turborepo monorepo, it separates concerns cleanly between core logic, 3D rendering, and UI components.

### Architecture

The project is organized as a monorepo with three main packages:

```
editor-v2/
├── apps/
│   └── editor/          # Next.js application (UI, tools, behaviors)
├── packages/
│   ├── core/            # Schema definitions, state management, systems
│   └── viewer/          # 3D rendering via React Three Fiber
```

**Separation of Concerns:**

| Package | Responsibility |
|---------|---------------|
| **@pascal-app/core** | Node schemas, scene state (Zustand), geometry systems, spatial queries, event bus |
| **@pascal-app/viewer** | 3D rendering, camera controls, post-processing |
| **apps/editor** | UI components, editing tools, selection management |

### Key Features

**Node-Based Scene Graph:**
- Flat dictionary structure with parent-child relationships via `parentId`
- Node hierarchy: Site → Building → Level → Walls/Slabs/Zones/Items
- Each node has auto-generated IDs with type prefixes (e.g., `wall_abc123`)

**State Management with Zustand:**
- Three separate stores for clean separation:
  - `useScene` - Scene data with IndexedDB persistence + undo/redo (Zundo)
  - `useViewer` - Camera modes, level display (stacked/exploded/solo)
  - `useEditor` - Active tool, panel states, preferences

**Dirty Node System:**
- Changes mark nodes as "dirty" for efficient re-rendering
- Systems only recompute geometry for affected nodes each frame
- Massive performance win for large scenes

**Reactive Geometry Systems:**
- WallSystem, SlabSystem, CeilingSystem, RoofSystem, ItemSystem
- Run in `useFrame` loop, updating Three.js objects based on node data
- Automatic CSG cutouts for doors/windows in walls

**Event-Driven Architecture:**
- Typed event emitter (mitt) for inter-component communication
- Events like `wall:click`, `item:enter`, `zone:context-menu`
- Spatial grid manager for collision detection and placement validation

### Tech Stack

- **Frontend:** Next.js, React, TypeScript
- **3D Rendering:** React Three Fiber, WebGPU
- **State:** Zustand with Zundo (undo/redo)
- **Persistence:** IndexedDB
- **Build:** Turborepo monorepo
- **Spatial:** Custom spatial grid manager for collision/placement

### Why It Matters

Pascal Editor demonstrates how to build a **production-grade 3D editor in the browser** with modern web technologies. The architecture is a masterclass in:

1. **Separation of concerns** - Core logic, rendering, and UI are cleanly separated
2. **Performance optimization** - Dirty node system avoids unnecessary recomputation
3. **Type safety** - Full TypeScript with discriminated unions for node types
4. **Developer experience** - Turborepo for monorepo management, Zustand for predictable state

This is the kind of architecture you'd want to study if you're building any kind of interactive 3D application on the web.

### Quick Start

```bash
# Clone the repository
git clone https://github.com/pascalorg/editor.git
cd editor

# Install dependencies
pnpm install

# Start development server
pnpm dev
```

### Repository & Resources

- [pascalorg/editor](https://github.com/pascalorg/editor)
- Built with React Three Fiber and WebGPU
- Trending #1 on GitHub today (March 25, 2026)

---

*Posted from GitHub Trending #1 - 3D/Graphics repository*
