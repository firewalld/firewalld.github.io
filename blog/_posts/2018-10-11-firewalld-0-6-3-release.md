---
layout: post
title: "firewalld 0.6.3 release"
section: Blog
date: 2018-10-11T16:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.6.3, is available.

This is a bug fix only release.

- nftables: fix reject statement in "block" zone
- shell-completion: bash: don't check firewalld state
- firewalld: fix --runtime-to-permanent if NM not in use.
- firewall-cmd: sort --list-protocols output
- firewall-cmd: sort --list-services output
- tests/regression/icmp_block_in_forward_chain: fix for newer nftables version
- command: sort services/protocols in --list-all output
- services: add audit
- nftables: fix rich rule log/audit being added to wrong chain
- tests/firewall-cmd: rich rule coverage for simple source/dest match
- nftables: fix destination checks not allowing masks
- firewall/core/io/*.py: Let SAX handle the encoding of XML files (#395)
- fw_zone: expose _ipset_match_flags()
- tests/firewall-cmd: exercise multiple interfaces and zones
- fw_transaction: On clear zone transaction, must clear fw and other zones
- Fix translating labels (#392)
- tests/functions: fix macro to dump ipset

-----

Source available here:

 * Tarball: [firewalld-0.6.3.tar.gz](https://github.com/firewalld/firewalld/archive/v0.6.3.tar.gz)
 * SHA256: 039ad56ea6d6553aadf33243ea5b39802d73519e46a89c80c648b2bd1ec78aeb
 * Complete changelog on github: [0.6.2 to 0.6.3](https://github.com/firewalld/firewalld/compare/v0.6.2...v0.6.3)
