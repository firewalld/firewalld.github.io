---
layout: page
title: "Options"
---

The configuration can contain these tags and attributes. Some of them are mandatory, others optional.

## icmptype

The mandatory icmptype start and end tag defines the icmptype. This tag can only be used once in an icmptype configuration file. This tag has optional attributes:

    version="string"

To give the icmptype a version.

## short

Is an optional start and end tag and is used to give an icmptype a more readable name.

## description

Is an optional start and end tag to have a description for a icmptype.

## destination

Is an optional empty-element tag and can be used only once. The destination tag specifies if an icmptype entry is available for IPv4 and/or IPv6. The default is IPv4 and IPv6, where this tag can be missing.

    ipv4="bool"

Describes if the icmptype is available for IPv4.

    ipv6="bool"

Describes if the icmptype is available for IPv6.
