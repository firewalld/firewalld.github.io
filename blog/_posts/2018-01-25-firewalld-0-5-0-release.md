---
layout: post
title: "firewalld 0.5.0 release"
section: Blog
date: 2018-01-25T14:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.5.0, is available.

This release is significant because it deprecates the firewallctl command. This
secondary CLI is a fair maintenance burden and doesn't provide anything useful
over firewall-cmd other than aesthetics.

Regarding developer related changes, firewalld has gained autotest support. Now
you can do a "make check" to run the testsuite. This has been integrated with
travis-ci so every push to master and PR automatically runs the testsuite.

#### Major changes

- firewallctl: mark deprecated (#261)
- new test framework with travis-ci integration
- SUSE ifcfg support

#### New services

- nmea-0183
- syncthing
- monogoDB
- upnp

-----

Source available here:

 * Tarball: [firewalld-0.5.0.tar.gz](https://github.com/firewalld/firewalld/archive/v0.5.0.tar.gz)
 * SHA256: ecd3adb714fe2ead77253d505cf430c6c640f2c088f2a779c0459f399629ab38
 * Complete changelog on github: [0.4.4.6 to 0.5.0](https://github.com/firewalld/firewalld/compare/v0.4.4.6...v0.5.0)
