---
layout: post
title: "firewalld 0.8.2 release"
section: Blog
date: 2020-04-01T12:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.8.2, is available.

This is a big fix only release.

However, it does reintroduce the [zone drifting
bug](https://firewalld.org/2020/01/allowzonedrifting) as a feature. This
behavior is disabled by default.

- improvement: build: add an option to disable building documentation
- Typo in firewall-config(1)
- Fix typo in TFTP service description
- doc: README: add note about language translations
- fix: rich: source/dest only matching with mark action
- feat: AllowZoneDrifting config option
- feat: nftables: support AllowZoneDrifting=yes
- feat: ipXtables: support AllowZoneDrifting=yes
- fix: firewall-offline-cmd: Don't print warning about AllowZoneDrifting
- fix: add logrotate policy
- doc: direct: add CAVEATS section
- fix: checkIP6: strip leading/trailing square brackets
- fix: nftables: remove square brackets from IPv6 addresses
- fix: ipXtables: remove square brackets from IPv6 addresses
- fix: nftables: ipset types using "port"
- fix: nftables: zone dispatch with multidimensional ipsets
- fix: ipset: destroy runtime sets on reload/stop
- fix: port: support querying sub ranges
- fix: source_port: support querying sub ranges
- doc: specify accepted characters for object names
- fix: doc: address copy/paste mistakes in short/description
- fix: configure: atlocal: quote variable values
- fix: nftables: allow set intervals with concatenations
- doc: clarify --set-target values "default" vs "reject"

-----

Source available here:

 * Tarball: [firewalld-0.8.2.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.8.2/firewalld-0.8.2.tar.gz)
 * SHA256: 391a750a2bfb9db1179829a136451daf256660b591d380ce504fd4e896f7d797
 * Complete changelog on github: [0.8.1 to 0.8.2](https://github.com/firewalld/firewalld/compare/v0.8.1...v0.8.2)
