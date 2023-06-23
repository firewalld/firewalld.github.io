---
layout: post
title: "firewalld 2.0.0 release"
section: Blog
date: 2023-06-23T17:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 2.0.0, is available.

This is a major release. The major version is being bumped symbolically
to reflect significant changes done in commit `f4d2b80adc84
("fix(policy): disallow zone drifting")`. It does not contain any
deliberate breaking changes.

Feature Blogs:

- [software fast path](https://firewalld.org/2023/05/nftables-flowtable)
- [zone priorities](https://firewalld.org/2023/04/zone-priorities)

Additionally the release contains the below new features.

Eric Garver (4):
- feat(direct): avoid iptables flush if using nftables backend
- feat(zone): add support for priority
- feat(nftables): add support for flowtable (software fastpath)
- feat(nftables): support counters

Juris Lambda (2):
- feat(service): add Zabbix Java Gateway
- feat(service): add Zabbix Web Service

Nikolas Koesling (14):
- feat(service): add game 0AD
- feat(service): add game anno 1602
- feat(service): add game anno 1800
- feat(service): add game Civilization IV
- feat(service): add game Civilization V
- feat(service): add game factorio
- feat(service): add game Minecraft
- feat(service): add game Need For Speed: Most Wanted
- feat(service): add game Stellaris
- feat(service): add game Stronghold Crusader
- feat(service): add game Super Tux kart
- feat(service): add game Terraria
- feat(service): add game Zero K
- feat(service): add game Settlers

Pat Riehecky (3):
- feat(service): add OpenTelemetry (OTLP) service
- feat(service): define statsrv from RFC 996
- feat(service): Add syscomlan

-----

Source available here:

 * Tarball: [firewalld-2.0.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v2.0.0/firewalld-2.0.0.tar.gz)
 * SHA256: 89a736515921e0dcc983e4206bcd958576c6023bcb9314096d3f8c1f7897301f
 * Complete changelog on github: [1.3.0 to 2.0.0](https://github.com/firewalld/firewalld/compare/v1.3.0...v2.0.0)
