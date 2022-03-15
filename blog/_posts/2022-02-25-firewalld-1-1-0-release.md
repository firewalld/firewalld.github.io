---
layout: post
title: "firewalld 1.1.0 release"
section: Blog
date: 2022-02-25T17:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 1.1.0, is available.

This is a feature release. It also includes all bug fixes since v1.0.0.

```
$ git shortlog --grep "^feat" 3c7e9c98e8222a918c2bb7353b32075843cdc661..v1.1.0
```

Christoph Muellner (1):
- feat(service): Add jellyfin service

Eric Garver (3):
- feat(build): distribute an OCI container image
- feat(policy): support OUTPUT forward ports
- feat: config check improvements

Juan Orti Alcaine (1):
- feat(service): add http3

Marcos Mello (1):
- feat(service): add service definition for WS-Discovery Client

Nigel Jewell (2):
- feat(service): add service definition for WS-Discovery
- feat(service): add service definition for AFP

TorontoMedia (1):
- feat(rich): Support nflog target and add log attribute errors/checks

proletarius101 (1):
- feat(service): add ZeroTier service

-----

Source available here:

 * Tarball: [firewalld-1.1.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v1.1.0/firewalld-1.1.0.tar.gz)
 * SHA256: ffab4bbe30d829e3a6a6a029ac4a6307073785c301368b3d8a7f523876037ff9
 * Complete changelog on github: [1.0.0 to 1.1.0](https://github.com/firewalld/firewalld/compare/v1.0.0...v1.1.0)
