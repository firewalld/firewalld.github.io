---
layout: post
title: "firewalld 0.6.4 release"
section: Blog
date: 2019-05-17T16:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.6.4, is available.

This is a bug fix only release.

- treewide: fix over indentation (flake8 E117)
- test: travis: add another test matrix for omitting ip6tables
- chore: travis: split test matrix by keywords
- chore: tests: add AT_KEYWORDS for firewall-offline-cmd
- improvement: tests: Use AT_KEYWORDS for backends
- fix: tests: guard occurrences of IPv6
- fix: tests/functions: ignore warnings about missing ip6tables
- test: add macro IF_IPV6_SUPPORTED
- test: add macro HOST_SUPPORTS_IP6TABLES
- test: pass IPTABLES make variables down to autotest
- fix: avoid calling backends that aren't available
- fix: tests/regression/rhbz1601610: ignore warning about version mismatch
- fix: tests/regression/pr323: don't check for nf_nat_proto_gre
- fix: do not flush entire ruleset in CHECK_NAT_COEXISTENCE
- fix: propagate exception if backend fails with IndividualCalls=yes
- fix: tests nftables: constant set compat between releases
- fix: document --check-config option
- fix: tests/nftables: compatibility with numeric output changes
- test/functions: Strip nft hook and policy from output
- tests/functions: normalize nft list rule output
- fix: on reload, set policy before cleanup
- fix: tests/regression/gh453: guarantee automatic helpers disabled
- test: add macro CHECK_NFT_CT_HELPER()
- test: add test to check for nftables helper objects
- fix: nftables: make helpers work by creating ct helper objects
- fix: ipXtables: using "mangle" in zone not dependent on "nat"
- fix: ipXtables: don't use tables that aren't available
- test: add tests for rich rule mark action
- fix: nftables rich rule mark not marking every packet
- rich rules: fix Rich_Mark logic
- test: add coverage for gh #482
- fix: rich rule forward-port deletion after reload
- tests/regression: coverage for enabling IP forwarding via forward-ports
- fw_zone: forward-ports: only enable IP forwarding if toaddr used
- doc: note that masquerade will enable IP forwarding
- doc: note that forward-port may enable IP forwarding
- fix issue #457
- ipXtables: Avoid inserting rules with index
- ipXtables: simplify rpfilter rule generation
- tests/functions: normalize ebtables inversion output
- tests/firewall-cmd: Coverage for interface wildcarding
- nftables: Allow interfaces with wildcards
- tests/firewall-cmd: remove redundant checks for TESTING_FIREWALL_OFFLINE_CMD
- tests/functions: for list macros skip if testing firewall-offline-cmd
- tests/functions: m4_strip expected output
- tests/functions: implement a better m4_strip()
- tests/regression/rhbz1601610: modify test to satisfy buggy kernel versions
- ipset: fix set apply if IndividualCalls=yes
- nftables: fix ipv6 rich rule forward-ports
- nftables: fix rich rule masquerade
- fw_zone: fix IPv6 rich rule forward-port without toaddr
- fw_zone: fix rich rule masquerading
- firewalld.spec: enforce nftables version requirements
- firewalld.spec: fix packaging of appdata
- nftables: fix panic mode not filtering output packets
- services/steam-streaming: update udp ports
- zanata: use version stable-0.6
- update translations
- rich rules: fix mark action
- tests/regression/rhbz1571957: exercise log-denied=broadcast
- ipXtables/nftables: Fix "object has no attribute '_log_denied'"
- config/lockdown-whitelist: Don't auto add "-Es" to interpreter

-----

Source available here:

 * Tarball: [firewalld-0.6.4.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.6.4/firewalld-0.6.4.tar.gz)
 * SHA256: 5a82a72fd9ad4cbbfb805bae615faa9b91a27855245de0fef3bcb06439394852
 * Complete changelog on github: [0.6.3 to 0.6.4](https://github.com/firewalld/firewalld/compare/v0.6.3...v0.6.4)
