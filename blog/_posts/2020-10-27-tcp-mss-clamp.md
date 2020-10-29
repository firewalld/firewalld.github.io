---
layout: post
title: "TCP MSS Clamping in Firewalld"
section: Blog
date: 2020-10-28T21:52:00
author: Vrinda Punj
category: Feature
---
## What is TCP MSS Clamping?
The maximum segment size is defined as the largest amount of data that can be received in a single
TCP segment. TCP MSS clamping is a feature that sets the maximum segment size used by a TCP
session. The way that it achieves this is during the TCP 3 way handshake, a server can set
the MSS in the outgoing TCP SYN packets signalling the maximum segment
size of the data packets that it can receive.

## Why is it needed?
The way that TCP MSS clamping was used in Firewalld before the addition of this feature
was by adding an iptables rule via direct rules. An example of enabling the TCP MSS clamp
feature through direct iptables rules would be the following command:

    # firewall-cmd --permanent --direct --add-passthrough ipv4 -t mangle -I FORWARD -p tcp --syn -j TCPMSS --clamp-mss-to-pmtu

In the example above, TCP MSS clamping is directly used by writing iptables rules.
However, since Firewalld is supposed to be an abstraction of iptables and nftables, it is more clean
to have it enabled as an option within Firewalld instead of having the user enable it by
writing direct rules.

## What does this feature do?
This feature adds TCP MSS clamping as an option in Firewalld rich rules, which gets
translated into the corresponding rules for whichever backend is enabled in firewalld.conf.

## What does this feature look like?
This feature adds an enable TCP MSS clamp option to Firewalld rich rules. The user has an
option called `tcp-mss-clamp` in rich rules. The `tcp-mss-clamp` option takes in an optional operand
called `value` which allows the user to set the maximum segment size. The maximum segment size can be set
to `pmtu` (path maximum transmission unit) or a value greater than or equal to to 536. If the user sets
`value` to `pmtu`, it sets the maximum segment size to the smallest MTU (maximum transmission unit) of
all the nodes between the source and the destination. This is a useful default because the user
doesn't have to manually set the MSS to the smallest MTU in the network path. By setting MSS to `pmtu`,
all packets will be small enough to be able to traverse the network path without being dropped or fragmented.

Examples of writing adding this feature with the operand value would be:

    # firewall-cmd --add-rich-rule='rule tcp-mss-clamp value=pmtu'
    # firewall-cmd --add-rich-rule='rule tcp-mss-clamp value=536'

If `value` is not provided then the maximum segment size is set to `pmtu`. An example of a command
where `value` is not provided is the following:

    # firewall-cmd --add-rich-rule=’rule tcp-mss-clamp’

The rich rule gets translated into either nftables or iptables rules depending on which backend is enabled.
For instance, if the user enables the TCP MSS clamp option and sets the maximum segment size as `pmtu`, and
the nftables backend is enabled, the following command would allow the user to see the corresponding
rule that sets the maximum segment size to `pmtu` added to nftables:

    #  nft list chain inet firewalld filter_FWDO_public_allow
    table inet firewalld {
            chain filter_FWDO_public_allow {
                    tcp flags syn tcp option maxseg size set rt mtu
            }
    }

As seen above, the rich rule that enabled TCP MSS clamping got translated to the appropriate nftables rule.

## When is this available?
This will be available on the next feature release of Firewalld.
