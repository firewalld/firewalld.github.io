---
layout: post
title: "firewalld 0.7.4 release"
section: Blog
date: 2020-04-01T17:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.7.4, is available.

This is a bug fix only release.

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
- test: verify AllowZoneDrifting=yes
- fix: firewall-offline-cmd: Don't print warning about AllowZoneDrifting
- fix: add logrotate policy
- fix: tests: regenerate testsuite if .../{cli,python}/*.at changes
- doc: direct: add CAVEATS section
- fix: checkIP6: strip leading/trailing square brackets
- fix: nftables: remove square brackets from IPv6 addresses
- fix: ipXtables: remove square brackets from IPv6 addresses
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

 * Tarball: [firewalld-0.7.4.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.7.4/firewalld-0.7.4.tar.gz)
 * SHA256: 0d74744e363a72aef1182325dbece54578faf39e7f2d8b377be1be57bb2e242f
 * Complete changelog on github: [0.7.3 to 0.7.4](https://github.com/firewalld/firewalld/compare/v0.7.3...v0.7.4)
