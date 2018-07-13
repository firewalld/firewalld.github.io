---
layout: post
title: "nftables backend"
section: Blog
date: 2018-07-24T14:00:00
author: Eric Garver
category: nftables
---

Introduction
------------
As noted in the [v0.6.0 release announcement]({% post_url
2018-07-12-firewalld-0-6-0-release %}), firewalld recently gained support for
using nftables as a firewall backend. This post will highlight why that's a
good thing, how it affects firewalld, and how to start using it. The content
here may be interesting to intermediate to advanced users of firewalld or
anyone generally interested in firewalling.

Why nftables?
-----------------
nftables in a replacement for all of; iptables, ip6tables, arptables, ebtables,
and ipset (henceforth know as "iptables and family"). It brings many
advantages, some examples are; built in sets, faster rule updates, and combined
ipv4/ipv6 processing. One of the most relevant advantages for firewalld is the
ability to maintain all firewall rules through a single interface.

One issue with firewalld's use of iptables and family is that firewalld assumes
complete control of the hosts firewalling. With the nftables backend this is no
longer true. Since nftables allows multiple namespaces (tables in nftables
vernacular), firewalld will scope all of its rules, sets, and chains to the
*firewalld* table. This will avoid much of the contention with other pieces of
software that don't interact directly with firewalld.

Another nicety of nftables is you can combine logging with verdicts in the same
rule. This means you can optimize rules, e.g. log and drop a packet in the same
rule. In iptables this would require two rules, both with the same match
parameters.

How does firewalld use nftables?
--------------------------------
firewalld interacts with nftables directly through the `nft` binary. This is
similar to how firewalld currently interacts with iptables and family. In a
future release interaction with nftables will be further improved by using the
newly minted libnftables.

As can be seen in the firewalld structure diagram, nftables fits into firewalld
alongside the other firewall backends.

![firewalld-structure+nftables](/documentation/firewalld-structure+nftables.png "firewalld structure")

All firewalld's primitives (services, ports, forward ports, etc.) use nftables
by default. In addition some translations occur; ipsets will be translated to
native nftables sets, and ICMP types are morphed into nftables equivalents.

### What about the direct interface?
Seasoned firewalld users may already be asking themselves, *What about the
direct interface?* No worries, it's still there and works almost exactly as it
did in previous releases. When the nftables backend is enabled direct rules are
treated specially and still use iptables and family. This means your existing
configurations with custom direct rules will continue to work. However, there
is one deliberate behavioral change - direct rules take precedence over *all*
other firewalld rules. For further details see the *Behavorial Changes* section
below.

How do I use the nftables backend?
----------------------------------
In firewalld 0.6.0 and later nftables is the default backend - so all you have
to do is upgrade. The switch over should be transparent to users. The nftables
backend has feature parity with the old iptables backend. That means any issues
or missing functionality will be treated as bugs.

If for some reason you need to revert to the old iptables backend, you can
easily do so by setting `FirewallBackend` in `/etc/firewalld/firewalld.conf` to
`iptables`, then restart firewalld. However, please realise that future
firewalld development will focus on the nftables backend and not iptables.

This new configuration option is documented in the [man
pages](/documentation/man-pages/firewalld.conf.html).

What the future holds
---------------------
The future of firewalld development will focus on the nftables backend. While
the iptables backend is still supported new features won't necessarily be
implemented.

With the nftables backend firewalld has many possible improvements on the
horizon:

- output filtering
- DoS protection or rate limiting
- log targets can be combined into the same rule as accept/drop
- avoid creating empty chains or rules

With all that said, the iptables backend is not going away anytime soon. It
will be supported for many, many releases. It's simply just not the primary
focus.

Further information
-------------------
Here follows further information that may be useful for those wanting some
grittier details.

### Behavioral Changes
The nftables backend does bring some behavioral changes. In most scenarios
these won't affect users, but may be relevant for more advanced use cases.

#### Direct interface precedence
In previous versions of firewalld rules added via the direct interface were
still subject to firewalld's rules that occur early in the ruleset. Most
notably is the early acceptance of packets that are part of existing
connections. This has led to confusion for users, for example see [github issue
44](https://github.com/firewalld/firewalld/issues/44).

With the nftables backend direct rules are deliberately given a higher
precedence than *all* other firewalld rules. Now when a user adds a direct rule
to drop traffic existing connections will also be affected.

#### Firewalld hook priority
nftables allows multiple chains to hook into netfilter at the same point. This
is in contrast to iptables which only allowed one and the concept was
completely hidden from users. firewalld takes advantage of this feature to add
predictability by giving firewalld's rules slightly lower precedence than
iptables and default nftables hook priority values. Without this it would be
undefined if firewalld's chains would execute before or after other
iptables/nftables chains.

The main consequence for users is that firewall rules created outside of
firewalld (e.g. libvirt, docker, user, etc) will take precedence over
firewalld's rules.

#### Only flush firewalld's rules
Since nftables allows namespaces (via tables) firewalld no longer does a
complete flush of firewall rules. It will only flush rules in the *firewalld*
table. This avoids scenarios where custom user rules or rules installed by
other tools are unexpectedly wiped out when firewalld was restarted or
reloaded.

#### Packet accept/drop precedence
As mentioned above, nftables allows multiple chains to use the same netfilter
hook. A consequence of this is that packets that are *accept*ed are still
subject to the rules of other chains hooked into the hook type. For firewalld
this means packets may be accepted early by custom iptables or nftables rules,
but will still be subject to firewalld's rules. In the *drop* case processing
always stops immediately and no other hooks will process the packet.
