---
layout: post
title: "firewalld 0.6.2 release"
section: Blog
date: 2018-09-19T16:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.6.2, is available.

This is a bug fix only release.

- nftables: fix log-denied with values other than "all" or "off"
- fw\_ipset: raise FirewallError if backend command fails
- ipset: only use "-exist" on restore
- fw\_ipset: fix duplicate add of ipset entries
- *tables: For opened ports/protocols/etc match ct state new,untracked
- nftables: fix rich rules ports/protocols/source ports not considering ct state
- ports: allow querying a single port added by range
- fw\_zone: fix services with multiple destination IP versions
- fw\_zone: consider destination for protocols
- firewall/core/fw\_nm: nm\_get\_zone\_of\_connection should return None or empty string instead of False
- nftables: fix rich rule audit log
- fw: if failure occurs during startup set state to FAILED
- services/high-availability: open all 8 ports used knetd/corosync

-----

Source available here:

 * Tarball: [firewalld-0.6.2.tar.gz](https://github.com/firewalld/firewalld/archive/v0.6.2.tar.gz)
 * SHA256: 76ef7ed41caf67204dc80e1f2640176a481c72cadc30488492b22e45b3757c54
 * Complete changelog on github: [0.6.1 to 0.6.2](https://github.com/firewalld/firewalld/compare/v0.6.1...v0.6.2)
