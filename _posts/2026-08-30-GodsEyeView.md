---
layout: post
title: "Trending: God's Eye View - A Spy Satellite Simulator in Your Browser"
date: 2026-08-30 00:00:00 +0800
categories: [Geospatial, Open Source, WebGL]
tags: [3D-globe, spatial-intelligence, satellite-tracking, Cesium, OSINT, JavaScript]
---

What if you could zoom from orbit to street level, track live aircraft and ships in real time, and peer through public cameras — all inside a photorealistic 3D globe running in your browser? That's the promise of **God's Eye View**, the newly open-sourced project from creator Bilawal Sidhu. Formerly known as WorldView, the project already captivated over 5 million viewers on YouTube, and now anyone can run it locally. It's as close as most of us will get to a spy satellite console — except every data source is public, and the globe is terrifyingly real.

Built on **CesiumJS**, the industry-standard WebGL globe engine, the application renders satellite imagery draped over a 3D terrain model with surprisingly low latency. JavaScript dominates the codebase at ~8.3M lines, with CSS and HTML for the UI layer and Shell scripts for deployment tooling. The architecture pulls from open APIs — ADS-B for aircraft, AIS for ships, USGS for earthquakes — and overlays them as real-time markers on the globe. It even integrates public webcam feeds, mapping physical cameras to their exact GPS coordinates, which means you can click on a location and literally see what's happening there right now. Stars: 12,618 ⭐ (+thousands today).

The feature set reads like a mission control checklist. **Live tracking** covers commercial aircraft (with flight numbers and altitude), maritime vessels (ship name, speed, heading), and satellite positions with orbit visualization. **Situational awareness** layers include seismic activity from USGS, real-time traffic data, and weather overlays. But the most futuristic capability is **hands-free voice control** powered by a realtime AI agent — you can literally talk to the globe and ask it to "show me flights over the Pacific" or "take me to Tokyo." It ships with a Node.js backend, a Cesium frontend, and straightforward .env-based configuration for API keys.

God's Eye View is surging on GitHub because it democratizes a capability that once required military budgets. It sits at the intersection of open-source intelligence (OSINT), real-time data visualization, and generative AI, all wrapped in a polished, consumer-grade interface. For developers, it's a masterclass in stitching together disparate public APIs into a cohesive spatial experience. For everyone else, it's a humbling reminder that with enough open data and the right rendering engine, the whole planet fits in one browser tab. URL: https://github.com/bilawalsidhu/gods-eye-view
