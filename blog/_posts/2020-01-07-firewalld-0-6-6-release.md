---
layout: post
title: "firewalld 0.6.6 release"
section: Blog
date: 2020-01-07T15:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.6.6, is available.

This is a bug fix only release. It is also the final release for this stable
branch.

- fix: src/tests/Makefile: distclean should clean atconfig
- tests/functions: increase firewalld debug level
- fix: test: use debug output based on autotest variable
- chore: doc: update authors
- fix: failure to load modules no longer fatal
- fix: don't probe for available kernel modules
- fix: build: distribute testsuite
- fix: tests: convert nftables fib checks to runtime
- fix: tests: convert probe of nft numeric args to runtime
- fix: tests: convert ip6tables checks to runtime
- fix: tests: convert host ipv6 checks to runtime
- chore: tests: rename IF_IPV6_SUPPORTED to IF_HOST_SUPPORTS_IPV6_RULES
- fix: test: CHECK_NAT_COEXISTENCE: only check for kernel version
- fix: test: direct passthrough: no need to check for dummy module
- fix: test/functions: FWD_END_TEST: improve grep for errors/warnings

-----

Source available here:

 * Tarball: [firewalld-0.6.6.tar.gz](https://github.com/firewalld/firewalld/releases/download/v0.6.6/firewalld-0.6.6.tar.gz)
 * SHA256: 24121326220a9508ac13b1bfc4f6702a8c75fe0dc295c345d7424fa2b64634f7
 * Complete changelog on github: [0.6.5 to 0.6.6](https://github.com/firewalld/firewalld/compare/v0.6.5...v0.6.6)
