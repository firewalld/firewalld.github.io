---
layout: post
title: "firewalld 0.8.1 release"
section: Blog
date: 2020-01-07T10:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.8.1, is available.

This is a big fix only release.

- fix: CLI: service: also output helpers for service info
- fix: reload: let NM interface assignments override permanent config
- tests: support running in containers, "make check-container"
- tests: add integration tests, e.g. network-manager

-----

Source available here:

 * Tarball: [firewalld-0.8.1.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.8.1/firewalld-0.8.1.tar.gz)
 * SHA256: ae21e813e1a185335603fdd02a6df386ae0574f54b44a6f7d75b08c7ae30843b
 * Complete changelog on github: [0.8.0 to 0.8.1](https://github.com/firewalld/firewalld/compare/v0.8.0...v0.8.1)
