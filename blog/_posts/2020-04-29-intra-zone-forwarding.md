---
layout: post
title: "Intra Zone Forwarding"
section: Blog
date: 2020-04-29T17:00:00
author: Eric Garver
category: feature
---

A new feature, intra zone forwarding, is coming to firewalld. This feature
allows packets to freely forward between interfaces or sources with in a zone.

## Why is it needed?

One axiom of zone based firewalls is that traffic with in a zone can flow from
interface (or source) to interface (or source). The zone specifies the trust
level of all those interfaces and sources. If they have the same trust level
then they can communicate unencumbered. Firewalld has lacked this functionality
until now.

## What does it look like?

This feature doesn't bring many CLI additions. Only a couple knobs to enable or
disable it for the zone.

Lets say we have our `home` zone with two interfaces: dummy1, and dummy2

```
# firewall-cmd --zone=home --add-interface=dummy1 --add-interface=dummy2
```

Now let's enable intra zone forwarding.

```
# firewall-cmd --zone=home --add-forward
```

This results in the following nftables rules being added to the zone.

```
table inet firewalld {
    chain filter_FWDI_home_allow {
        oifname "dummy1" accept
        oifname "dummy2" accept
    }
}
```

The rules say: if the packet is destined to the any interface in the zone
`home` then go ahead and accept it.

If we were to add another interface or source to the home zone then we will see
it show up in the ruleset as well.

```
# firewall-cmd --zone=home --add-source 10.10.10.0/24
```

And the result:

```
table inet firewalld {
    chain filter_FWDI_home_allow {
        oifname "dummy1" accept
        oifname "dummy2" accept
        ip daddr 10.10.10.0/24 accept
    }
}
```

## Doesn't this already happen?

Some zones use a `--set-target` of `ACCEPT`. Those zones immediately accept
*all* forwarded traffic. As such, the new `--add-forward` option has no effect
for them.

For all others `--set-target` values forwarded traffic is dropped by default.
This includes all stock zones except *trusted*.

## Caveats

When enabled in the *default zone*, intra zone forwarding can only be applied
to the interfaces and sources that have been explicitly added to the current
*default zone*. It can not use a catch-all for all outgoing interfaces as this
would allow packets to forward to an interface or source assigned to a
different zone.

## Default value

By default, all currently shipped zone definitions and user created zones have
`forward` disabled. This is done as to not introduce any surprising behavioral
changes.

In the future this may change. It may make sense to enable by default in at
least these zones: internal, home, and work.

## Contributed By

This feature was initially contributed by github user
[@danc86](https://github.com/danc86) in pull request
[#586](https://github.com/firewalld/firewalld/pull/586).
