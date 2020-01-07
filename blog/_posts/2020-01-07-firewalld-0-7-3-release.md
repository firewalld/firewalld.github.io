---
layout: post
title: "firewalld 0.7.3 release"
section: Blog
date: 2020-01-07T15:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.7.3, is available.

This is a bug fix only release.

- fix: src/tests/Makefile: distclean should clean atconfig
- fix: test: use debug output based on autotest variable
- chore: doc: update authors
- fix: tests/functions: canonicalize XML output
- fix: failure to load modules no longer fatal
- fix: don't probe for available kernel modules
- fix: build: distribute testsuite
- fix: tests: convert nftables fib checks to runtime
- fix: tests: convert probe of nft numeric args to runtime
- fix: tests: convert ip6tables checks to runtime
- fix: tests: convert host ipv6 checks to runtime
- chore: tests: rename IF_IPV6_SUPPORTED to IF_HOST_SUPPORTS_IPV6_RULES
- fix: reload: let NM interface assignments override permanent config
- fix: test: CHECK_NAT_COEXISTENCE: only check for kernel version
- fix: test: direct passthrough: no need to check for dummy module
- fix: test/functions: FWD_END_TEST: improve grep for errors/warnings
- tests: support running in containers, "make check-container"
- tests: add integration tests, e.g. network-manager

-----

Source available here:

 * Tarball: [firewalld-0.7.3.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.7.3/firewalld-0.7.3.tar.gz)
 * SHA256: 414c46202c12334cd5c986214e5e2575d18e743c5531a97ace1c0cd94341c60d
 * Complete changelog on github: [0.7.2 to 0.7.3](https://github.com/firewalld/firewalld/compare/v0.7.2...v0.7.3)
