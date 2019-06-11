---
layout: post
title: "firewalld 0.7.0 release"
section: Blog
date: 2019-06-11T19:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.7.0, is available.

This is a feature release. It also includes all bug fixes since v0.6.0.

New features:
- [Rich Rule Priorities](https://firewalld.org/2018/12/rich-rule-priorities)
- Service Definition Includes  
  Service definitions can now include lines like: `<include service="https"/>`
  which will include all the ports, etc from the https service.
- RFC3964 IPv4 filtering  
  A new option `RFC3964_IPv4` in `firewalld.conf` is available. It does
  filtering based on RFC3964 in regards to IPv4 addresses. This functionality
  was traditionally in `network-scripts`.
- FlushAllOnReload  
  A new option `FlushAllOnReload` in `firewalld.conf` is available. Older
  releases retained some settings (direct rules, interface to zone assignments)
  during a *\-\-reload*. With the introduction of this configuration option
  that is no longer the case. Old behavior can be restored by setting
  `FlushAllOnReload=no`.
- 15 new service definitions

Statistics since v0.6.0:
- 266 commits
- 111 files changed, 4752 insertions(+), 1986 deletions(-)

-----

Source available here:

 * Tarball: [firewalld-0.7.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.7.0/firewalld-0.7.0.tar.gz)
 * SHA256: bef3e555d99fba51487095e6977aed7cfd582a7ab8505e6d7335e6e833ea42a1
 * Complete changelog on github: [0.6.0 to 0.7.0](https://github.com/firewalld/firewalld/compare/v0.6.0...v0.7.0)
