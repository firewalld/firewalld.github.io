---
layout: post
title: "Allowing Zone Drifting"
section: Blog
date: 2020-01-31T08:00:00
author: Eric Garver
category: feature
---

# Allowing Zone Drifting

A future release of firewalld will contain a behavioral change that may affect
some users. Older version of firewalld had undocumented behavior that has come
to be known as **zone drifting**.

The default value of `AllowZoneDrifting` is *no*. To regain the old, buggy
behavior users can set this to *yes*.

## What is zone drifting?

A user may configure a source-based *zoneFoo* - a zone to which you've added
sources via `--add-source`. If *zoneFoo* uses a `--set-target` of *default*,
then the packets will be allowed to ingress a second interface-based zone. This
includes the catch-all *default zone*.

This is a result of how previous version of firewalld dispatched packets to
zones.

Each dispatch type used to have it's own dedicated chain.

```
chain filter_INPUT {
    ...
    jump filter_INPUT_ZONES_SOURCE  # The important
    jump filter_INPUT_ZONES         # parts are here
    ...
}
chain filter_INPUT_ZONES_SOURCE {
    ip6 saddr dead:beef::/54 goto filter_IN_internal
}
chain filter_INPUT_ZONES {
    iifname "dummy0" goto filter_IN_trusted
    goto filter_IN_public
}
```

They key bit, as noted by the comment, is that there are two different chains
performing dispatch. One for source-based. One for interface-based. If the
chain *filter_IN_internal* is non-terminal, as is the case if `--set-target` is
*default*, then packet processing will return to the *filter_INPUT* chain and
jump to the *filter_INPUT_ZONES* chain. This means a packet can ingress both
the *internal* zone and the *trusted*/*public* zones.

## Why disable it by default?
A tenant of zone based firewalls is that packets ingress one and only one zone.
The above is a violation of that. It can cause traffic or services to be
allowed unexpectedly.

This can be see by the various bug reports:

- [issue 441](https://github.com/firewalld/firewalld/issues/441)
- [issue 258](https://github.com/firewalld/firewalld/issues/258)

For these reasons `AllowZoneDrifting` defaults to *no*.

## Slightly different than previous firewalld versions

Even with `AllowZoneDrifting` set to *yes* there is a slight behavioral
difference between previous firewalld versions and current versions. This only
applies to a subset of features; masquerade, forward-port, and helpers. For
these features, zone drifting could occur for any value of `--set-target`
including *ACCEPT*, *DROP*, *REJECT* even amongst interface-based zones.

This is the cause of the following issues:

- [issue 258](https://github.com/firewalld/firewalld/issues/258)

It was deemed a security bug by firewalld developers and has no reasonable use
case. As such, it was not carried forward when `AllowZoneDrifting` was
featured.

## How to re-enable zone drifting?

The firewalld developers strongly discourage enabling zone drifting. It is
better to add the necessary services and configuration to the source-based
zone.

That being said, if you would like to enable zone drifting it can easily be
done by setting `AllowZoneDrifting` to *yes* in */etc/firewalld/firewalld.conf*
and restarting firewalld.

## What versions are affected?

The following versions fixed the zone drifting bug and disallowed its
occurrence:

- 0.6.5
- 0.7.0
- 0.8.0

`AllowZoneDrifting` was introduced in the following versions allowing users to
regain the old behavior.

- 0.7.4
- 0.8.2
- 1.0.0
