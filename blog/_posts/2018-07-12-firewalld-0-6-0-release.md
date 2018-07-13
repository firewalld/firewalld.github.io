---
layout: post
title: "firewalld 0.6.0 release"
section: Blog
date: 2018-07-12T12:00:00
author: Eric Garver
category: release
---

A new release of firewalld, version 0.6.0, is available.

This is a large feature release. Some new features warrant a separate blog
post. As such, the release is only summarized here.

User facing features:

- **nftables backend**  
This is the new default for all firewalld's abstractions. The direct interface
still supports iptables, ip6tables, and ebtables. It is configurable via
`FirewallBackend` in `/etc/firewalld.conf` - valid values are; `nftables`,
`iptables`.
- new services  
apcupsd, cockpit, distcc, etcd, finger, iSNS, llmnr, matrix, mqtt, nut, plex,
rtsp, salt-master, samba-dc, slp, steam, subversion, svdrp, wbem-http, wsman
- updated translations

A lot of development time was spent on improving continuous integration and
sanity checks to give confidence in new code changes and contributions from
others. This is reflected below in the list of developer focused improvements.

Developer focused improvements:

- lots of code refactoring to abstract firewall backend
- flake8 source code checking
- better debug output on exceptions (tracebacks)
- testsuite runs inside network namespaces
- improved testsuite coverage

New dependencies for nftables backend:

- nftables >= 0.9.0
- linux >= 4.18

While most of the nftables backend will function with earlier versions of
nftables and Linux it is not recommended. Many bugs were found and fixed in
these packages while firewalld's nftables backend was being developed. Some
examples are; iptables and nftables NAT coexistence, nftables AUDIT support,
nftables set ranges with timeouts.

-----

Source available here:

 * Tarball: [firewalld-0.6.0.tar.gz](https://github.com/firewalld/firewalld/archive/v0.6.0.tar.gz)
 * SHA256: 7aaa73dc95857079aa276e29d7d628d0faa7d50f29f5a0b6bae458ee7a5829a2
 * Complete changelog on github: [0.5.0 to 0.6.0](https://github.com/firewalld/firewalld/compare/v0.5.0...v0.6.0)
