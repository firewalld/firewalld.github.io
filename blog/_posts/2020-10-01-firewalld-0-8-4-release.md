---
layout: post
title: "firewalld 0.8.4 release"
section: Blog
date: 2020-10-01T14:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.8.4, is available.

This is a bug fix only release.

Eric Garver (25):
- fix(rich): nftables: log level "warning"
- fix(rich): icmptypes with one family
- fix(LastUpdatedOrderedDict): \_\_getitem\_\_(): fetch from list if int
- fix(rich): use correct error code for invalid priority
- fix(icmptype): when applying rules get ict from perm config
- fix(rich): clamp the IP families to those actually enabled
- fix(rich icmptype): verify rule and icmptype families don't conflict
- fix(nftables): packet marks with masks
- fix(nftables): icmp types with code == 0
- fix(ipXtables): rich: avoid duplicate rules for icmp-type w/ mark action
- fix(policy): cache rule_str for rich rules
- fix(icmptype): nftables: runtimeToPermanent if ip6tables not available
- docs(firewall-cmd): clarify lockdown whitelist command paths

Paul Wouters (1):
- improvement(service): IPsec: Update description and add TCP port 4500

Vladislav Grigoryev (1):
- fix(cli): unify indentation for forward-ports and rich rules

-----

Source available here:

 * Tarball: [firewalld-0.8.4.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.8.4/firewalld-0.8.4.tar.gz)
 * SHA256: 40dd99371b27e0efd60a8a148617289b7fa581eca87c84f6aefa2a5d8b346f0c
 * Complete changelog on github: [0.8.3 to 0.8.4](https://github.com/firewalld/firewalld/compare/v0.8.3...v0.8.4)
