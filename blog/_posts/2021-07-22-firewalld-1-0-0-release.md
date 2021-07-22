---
layout: post
title: "firewalld 1.0.0 release"
section: Blog
date: 2021-07-22T17:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 1.0.0, is available.

## Major version bump
This release is also a major version bump. It includes [breaking and
behavioral changes](https://firewalld.org/2021/06/the-upcoming-1-0-0).
Please read the blog post.

This is also a feature release. It includes all bug fixes since v0.9.0.

Highlights include:
- Reduced dependencies
- Intra-zone forwarding by default
- NAT rules moved to inet family (reduced rule set)
- Default target is now similar to reject
- ICMP blocks and block inversion only apply to input, not forward
- tftp-client service has been removed
- iptables backend is deprecated
- Direct interface is deprecated
- CleanupModulesOnExit defaults to no (kernel modules not unloaded)

----

## New features
```
$ git shortlog --grep "^feat.*:" v0.9.0..v1.0.0                   
```
Derek Dai (1):
- feat(rich): support using ipset in destination

Eric Garver (2):
- feat: add netbios-ns service
- feat(firewalld): drop linux capabilities

Georg Sauthoff (1):
- feat(service): Add WireGuard service definition

Pat Riehecky (1):
- feat(service): Add Kubernetes definitions

Paul Laufer (1):
- feat(config): add CleanupModulesOnExit configuration option

Vrinda Punj (3):
- feat(rich): add XML parsing/CLI parsing for tcp-mss-clamp
- feat(rich): add backend translation for tcp-mss-clamp
- feat(service): add galera service Fixes: rhbz1696260

张龙涛 (2):
- feat(shell-completion): Add zsh completion of policy
- feat(shell-completion/zsh): add sub option for --policy

## Breaking changes
```
$ git shortlog --grep "BREAKING CHANGE" v0.9.0..v1.0.0
```
Eric Garver (9):
- build(configure): require python >= 3.6
- chore(zone): enable intra-zone forwarding by default for new zones
- chore(zone): enable intra-zone forwarding by default for shipped zones
- docs(README): clarify dependencies
- improvement(nftables): use inet family for nat rules
- fix(zone): target: default is now similar to reject
- improvement(zone): icmp_block: now only applies to INPUT
- improvement(zone): icmp_block_inversion: now only applies to INPUT
- chore: remove broken tftp-client service

-----

Source available here:

 * Tarball: [firewalld-1.0.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v1.0.0/firewalld-1.0.0.tar.gz)
 * SHA256: 4c2ced8d2007d4a4aaf8a3f1ccc2e3a8c4089e60061f767a2992e867cfbe9ca0
 * Complete changelog on github: [0.9.0 to 1.0.0](https://github.com/firewalld/firewalld/compare/v0.9.0...v1.0.0)
