---
layout: post
title: "firewalld 0.8.0 release"
section: Blog
date: 2019-11-05T10:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.8.0, is available.

This is a feature release. It also includes all bug fixes since v0.7.0.

New features:
- nftables: convert to [libnftables JSON interface](https://firewalld.org/2019/09/libnftables-JSON)
  This completely converts firewalld to using the libnftables JSON interface.
  Firewalld no longer makes calls to the `nft` binary. It drastically improves
  rule application times and reliability by applying rules in large
  transactions.
- service: new "helper" element to replace "module"
  More accurately represents the conntrack helper. Deprecates "module".
- allow custom helpers using standard helper modules (rhbz 1733066)
- testsuite is now shipped in the dist tarball

Statistics since v0.7.0:
- 100 commits
- 74 files changed, 3593 insertions(+), 2163 deletions(-)

-----

Source available here:

 * Tarball: [firewalld-0.8.0.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.8.0/firewalld-0.8.0.tar.gz)
 * SHA256: a1835af972b0f3b6053ae6d8c63e24515d29de151f41b466ac0fd954cab60f1b
 * Complete changelog on github: [0.7.0 to 0.8.0](https://github.com/firewalld/firewalld/compare/v0.7.0...v0.8.0)
