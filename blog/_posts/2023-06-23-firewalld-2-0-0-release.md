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
to reflect significant changes done in commit f4d2b80adc84
("fix(policy): disallow zone drifting"). It does not contain any
deliberately breaking changes.

Feature Blogs:

- [software fast path](https://firewalld.org/2023/05/nftables-flowtable)
- [zone priorities](https://firewalld.org/2023/04/zone-priorities)

Additionally the release contains the below new features.

Eric Garver (4):
- b7faa74db15e ("feat(direct): avoid iptables flush if using nftables backend")
- cb1d47611131 ("feat(zone): add support for priority")
- a0d0a760db4b ("feat(nftables): add support for flowtable (software fastpath)")
- 99894f70e313 ("feat(nftables): support counters")

Juris Lambda (2):
- db13db701b85 ("feat(service): add Zabbix Java Gateway")
- 81b17fd5da35 ("feat(service): add Zabbix Web Service")

Nikolas Koesling (14):
- 3127b16cb566 ("feat(service): add game 0AD")
- eac23ccb0772 ("feat(service): add game anno 1602")
- 547a9ecad827 ("feat(service): add game anno 1800")
- ab5e46893cf1 ("feat(service): add game Civilization IV")
- edbcaecb13b8 ("feat(service): add game Civilization V")
- d99683cae26e ("feat(service): add game factorio")
- 4697e148aaa8 ("feat(service): add game Minecraft")
- 69649c599e63 ("feat(service): add game Need For Speed: Most Wanted")
- a87426fd99d7 ("feat(service): add game Stellaris")
- 1f7d664a6f31 ("feat(service): add game Stronghold Crusader")
- aa6bce9149c5 ("feat(service): add game Super Tux kart")
- 2c246f3224c7 ("feat(service): add game Terraria")
- 4d5bef92ac09 ("feat(service): add game Zero K")
- e9fc8c812bf7 ("feat(service): add game Settlers")

Pat Riehecky (3):
- 77c7061cc191 ("feat(service): add OpenTelemetry (OTLP) service")
- c2a6c8fc6315 ("feat(service): define statsrv from RFC 996")
- 2b58cb7d4a97 ("feat(service): Add syscomlan")

-----

Source available here:

 * Tarball: [firewalld-2.0.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v2.0.0/firewalld-2.0.0.tar.gz)
 * SHA256: 89a736515921e0dcc983e4206bcd958576c6023bcb9314096d3f8c1f7897301f
 * Complete changelog on github: [1.3.0 to 2.0.0](https://github.com/firewalld/firewalld/compare/v1.3.0...v2.0.0)
