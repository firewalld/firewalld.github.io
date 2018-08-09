---
layout: post
title: "firewalld 0.6.1 release"
section: Blog
date: 2018-08-09T14:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.6.1, is available.

This is a bug fix only release.

- Correct source/destination in rich rule masquerade
- Only modify ifcfg files for permanent configuration changes
- Fix a backtrace when calling common\_reverse\_rule()
- man firewalld.conf: Show nftables is the default FirewallBackend
- firewall-config: fix some untranslated strings that caused a UI bug causing rich rules to not be modify-able
- services/steam-streaming: replace unicode quotation with ASCII apostrophe
- fw\_direct: avoid log for untracked passthrough queries
- fixed many issues if iptables is actually iptables-nft
- Use preferred location for AppData files
- ipXtables: fix ICMP block inversion with set-log-denied
- fixes ICMP block inversion with set-log-denied with IndividualCalls=yes
- nftables: fix set-log-denied if target is not ACCEPT
- fw\_direct: strip \_direct chain suffix if using nftables

Improved interactions with NetworkManager:

- For generated NetworkManager connections, don't forward request to NetworkManager
- For non-permanent interface to zone assignments don't involve NetworkManager
- Query NetworkManager for permanent interface assignments

testsuite fixes:

- tests/functions: Remove bashism
- installcheck: pass PYTHON to testsuite, fixes python tests on distro with mixed python versions
- testsuite: avoid multiple inclusion warning
- testsuite: Only enable debug output if testsuite ran with debug flag

-----

Source available here:

 * Tarball: [firewalld-0.6.1.tar.gz](https://github.com/firewalld/firewalld/archive/v0.6.1.tar.gz)
 * SHA256: 9fd94f4a5803ec6d1bf4a15f3b90d46fdf0ffa1b5187ff80a470460e3a1a8538
 * Complete changelog on github: [0.6.0 to 0.6.1](https://github.com/firewalld/firewalld/compare/v0.6.0...v0.6.1)
