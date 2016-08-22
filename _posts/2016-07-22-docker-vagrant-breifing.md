---
layout: post
title: Docker and Vagrant Breifing
tags:
    - DevOps
---

# What is docker?

Docker, previously called dotCloud and open-sourced in 2013, is a Linux-only virtual environment (VE) tool, not a VM tool. It builds on LxC (LinuX Containers), which uses the cgroups functionality to enable creation and running of multiple isolated Linux virtual environments (VE) on a single control host.

## How it works>?
Docker is really an extension of LxC, which is itself a sort of supercharged Linux chroot. LxC can only isolate not just your installed applications, but even the entire OS. What Docker does is give you the ability to snapshot the OS and apps you want into a common image, then easily deploy this image on other Docker hosts;

# What is vagrant?
Vagrant, an open-source product released in 2010, is best described as a __VM manager__. It allows you to script and package the VM config and the provisioning setup. It is designed to run on top of almost any VM tool – VirtualBox, VMWare, AWS, etc.

## How it works?
Vagrant, on the other hand, still creates VM’s, although these are still lighter than the full-fat VM’s created by VM emulators. Vagrant provides a reproducible way to generate fully virtualized machines using Oracle's VirtualBox, AWS or VMWare technology as providers. There is a plugin called vagrant-libvirt, which adds support for libvirt to Vagrant.

# VE differs to VM
So unlike a VM, a VE like Docker doesn’t create its own virtual computer with a distinct OS and processors and hardware emulation. A VE is VM-lite; it rides on the already existing kernel’s image of the underlying hardware, and only creates a ‘container’ in which to run your apps, and even recreate the OS if you want since the OS is also just another app running on the kernel. It places only a little extra load on the system, so unlike the traditional VM there is very little overhead when using Docker. 
EOB
//