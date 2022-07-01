---
layout: post
title: "firewalld 1.2.0 release"
section: Blog
date: 2022-07-01T12:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 1.2.0, is available.

This is a feature release. It also includes all bug fixes since v1.1.0.

```
git shortlog --no-merges --grep "^feat" v1.1.0..v1.2.0
```

Adrian Freihofer (1):
- feat(firewalld): add new --log-target parameter

BrennanPaciorek (1):
- feat(service): add snmptls, snmptls-trap services

Donald Yandt (1):
- feat(service): add IPFS service

Eric Garver (1):
- feat(fw): startup failsafe

Matyáš Kroupa (2):
- feat(service): Add kubelet-readonly
- feat(service): Add secure version of k8s controller-plane components

Olav Reinert (1):
- feat(bash): completion of policy-related commands

Pat Riehecky (2):
- feat(service): add checkmk agent service
- feat(service): add netdata service

Poorchop (1):
- feat(service): add ident

Robotic-Brain (1):
- feat(service): Add service port definitions for ausweisapp2

Subhendu Ghosh (1):
- feat(service): add prometheus node-exporter

beta-tester (1):
- feat(service): add gpsd

hos7ein (1):
- feat(service): add CrateDB

nl6720 (2):
- feat(service): add ps3netsrv service
- feat(service): add Kodi JSON-RPC and EventServer services

-----

Source available here:

 * Tarball: [firewalld-1.2.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v1.2.0/firewalld-1.2.0.tar.gz)
 * SHA256: 28fd90e88bda0dfd460f370f353474811b2e295d7eb27f0d7d18ffa3d786eeb7
 * Complete changelog on github: [1.1.0 to 1.2.0](https://github.com/firewalld/firewalld/compare/v1.1.0...v1.2.0)
