---
layout: post
title: "Rich Rule Priorities"
section: Blog
date: 2018-12-18T14:00:00
author: Eric Garver
category: feature
---

# Rich Rule Priorities
Recently firewalld gained support for a priority field in the rich rule syntax.
It allows fine grained control over rich rules and their execution order. This
enables using rich rules in ways not possible before.

## Why is it needed?
One issue with current rich rules is that they are organized based on their
rule action. Log always occurs before deny. Deny always occurs before allow.
This has led to confusion from users as this implicitly reorders rules. It also
made it impossible to add a catch-all rich rule to deny traffic.

More information on this can be found in the
[firewalld.richlanguage](/documentation/man-pages/firewalld.richlanguage.html)
man page in the section "Information about logging and actions".

## What does it look like?
The syntax modifications add a new **priority** field. This can be any number
between -32768 and 32767, where lower numbers have higher precedence. This range is
large enough to allow automatic rule generation from scripts or other entities.

Example:

    # firewall-cmd --add-rich-rule='rule priority=1234 service name="mdns" allow'

Based on the **priority** rules are organized into different chains.

* If **priority < 0**, the rule goes into a chain with the suffix *_pre*.
* If **priority > 0**, the rule goes into a chain with the suffix *_post*.
* If **priority == 0**, the rule goes into a chain ( *_log*, *_deny*, *_allow* )
  based on their action. This is the same behavior as rich rules before
  priority support.

Inside these sub-chains rules are sorted according to their priority value. If
they have the same priority value, then it's undefined in what order they will
be executed.

Putting it all together a zone's set of chains now looks like below:

    # nft list chain inet firewalld filter_IN_public
    table inet firewalld {
            chain filter_IN_public {
                    jump filter_IN_public_pre
                    jump filter_IN_public_log
                    jump filter_IN_public_deny
                    jump filter_IN_public_allow
                    jump filter_IN_public_post
                    meta l4proto { icmp, ipv6-icmp } accept
            }
    }

A couple key points from this layout:

* *_pre* can occur before normal log rules.
* *_post* execution always occurs after firewalld's other primitives (services,
  ports, etc). This makes it a good place for catch-all type rules.
* *_pre* and *_post* chains may contain rich rules with any type of action
  (accept, deny, log, audit, etc)

## Examples (use cases)
Below are some examples, but they don't even scratch the surface of what's
possible now that rich rules support arbitrary ordering.

### Log all traffic not caught by other rules
Using a very low precedence rich rule you can log all traffic that has not yet
been denied or accepted. This is useful to flag any unexpected traffic. It can
also be a way to implement the zone level equivalent to *--log-denied*.

    # firewall-cmd --add-rich-rule='rule priority=32767 log prefix="UNEXPECTED: " limit value="5/m"'

This results in the following:
    
    # nft list chain inet firewalld filter_IN_public_post
    table inet firewalld {
            chain filter_IN_public_post {
                    log prefix "UNEXPECTED: " limit rate 5/minute
            }
    }

### Special policy for subset of traffic
To mimic a policy for only a subset of source addresses you can use a low
precedence rule.

    # firewall-cmd --add-rich-rule='rule family="ipv4" priority=32767 source address="10.1.1.0/24" reject'

This results in the following:

	# nft list chain inet firewalld filter_IN_public_post
	table inet firewalld {
			chain filter_IN_public_post {
					ip saddr 10.1.1.0/24 reject
			}
	}

### Allow a service for a subset of sources
This example allows a service for a subset of sources, then logs and denies it
for everyone else.

    # firewall-cmd --add-rich-rule='rule family="ipv4" priority=-100 source address="10.1.1.0/24" service name="ssh" accept'
    # firewall-cmd --add-rich-rule='rule priority=-99 service name="ssh" log'
    # firewall-cmd --add-rich-rule='rule priority=-98 service name="ssh" reject'

This results in the following:

    # nft list chain inet firewalld filter_IN_public_pre
    table inet firewalld {
            chain filter_IN_public_pre {
                    ip saddr 10.1.1.0/24 tcp dport 22 ct state new,untracked accept
                    tcp dport 22 ct state new,untracked log
                    tcp dport 22 ct state new,untracked reject
            }
    }

## Compatibility
To maintain compatibility rich rules that have a **priority == 0** or an absent
priority will behave as they've done in the past. They'll be sorted into the
*_log*, *_deny*, and *_allow* chains based on their action.

## When will they be available?
Rich rules with priority support will be available in the next minor firewalld
release, which will most likely be v0.7.0. However, the feature may be
backported to distributions that do that sort of thing.
