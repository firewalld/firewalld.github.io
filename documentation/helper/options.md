---
layout: page
title: "Options"
---

The configuration can contain these tags and attributes. Some of them are mandatory, others optional.

## helper

The mandatory helper start and end tag defines the helper. This tag can only be used once in a helper configuration file. There is one mandatory and two optional attributes for helpers:

    module="string"

The mandatory module of the helper. This is one of the netfilter conntrack helper modules. The name starts with `nf_conntrack_` and has one or several module aliases that start with `nfct-helper-`. The nf conntrack helpers are located in the `/lib/modules/$(uname -r)/kernel/net/netfilter/` directory.

    family="ipv4|ipv6"

The optional family of the helper. This can be one of these ipv types: `ipv4` or `ipv6`. If the family is not specified, then the helper is usable for IPv4 and IPv6.

    version="string"

The optional version of the helper.

## short

Is an optional start and end tag and is used to give a helper a more readable name.

## description

Is an optional start and end tag to have a description for a helper.

## port

Is an empty-element tag and can be used several times to have more than one port entry. All attributes of a port entry are mandatory:

    port="string"

The port string can be a single port number or a port range portid-portid or also empty to match a protocol only.

    protocol="string"

The protocol value can either be tcp, udp, sctp, or dccp.
