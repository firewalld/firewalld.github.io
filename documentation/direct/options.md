---
layout: page
title: "Options"
---

Direct configuration gives a more direct access to the firewall. It requires user to know basic ip(6)tables/ebtables concepts, i.e. table (`filter/mangle/nat/...`), chain (`INPUT/OUTPUT/FORWARD/...`), commands (`-A/-D/-I/...`), parameters (`-p/-s/-d/-j/...`) and targets (`ACCEPT/DROP/REJECT/...`). Direct configuration should be used only as a last resort when it's not possible to use [firewalld.zone(5)](../man-pages/firewalld.zone.html). See also Direct Options in [firewall-cmd(1)](../man-pages/firewall-cmd.html).

A firewalld direct configuration file contains informations about permanent direct chains, rules and passthrough ...

This is the structure of a direct configuration file:

    <?xml version="1.0" encoding="utf-8"?>
    <direct>
      [ <chain ipv="ipv4|ipv6|eb" table="table" chain="chain"/> ]
      [ <rule ipv="ipv4|ipv6|eb" table="table" chain="chain" priority="priority"> args </rule> ]
      [ <passthrough ipv="ipv4|ipv6|eb"> args </passthrough> ]
    </direct>

## direct

The mandatory direct start and end tag defines the direct. This tag can only be used once in a direct configuration file. There are no attributes for direct.

## chain

Is an optional empty-element tag and can be used several times. It can be used to define names for additional chains. A chain entry has exactly three attributes: 

    ipv="ipv4|ipv6|eb"

The IP family where the chain will be created. This can be either ipv4, ipv6 or eb. 

    table="table"

The table name where the chain will be created. This can be one of the tables that can be used for iptables, ip6tables or ebtables. For the possible values, see TABLES section in the iptables, ip6tables or ebtables man pages. 

    chain="chain"

The name of the chain, that will be created. Please make sure that there is no other chain with this name already. 

Please remember to add a rule or passthrough rule with an `--jump` or `--goto` option to connect the chain to another one. 

## rule

Is an optional element tag and can be used several times. It can be used to add rules to a built-in or added chain. A rule entry has exactly four attributes: 

    ipv="ipv4|ipv6|eb"

The IP family where the rule will be added. This can be either ipv4, ipv6 or eb. 

    table="table"

The table name where the rule will be added. This can be one of the tables that can be used for iptables, ip6tables or ebtables. For the possible values, see TABLES section in the iptables, ip6tables or ebtables man pages. 

    chain="chain"

The name of the chain where the rule will be added. This can be either a built-in chain or a chain that has been created with the chain tag. If the chain name is a built-in chain, then the rule will be added to chain_direct, else the supplied chain name is used. chain_direct is created internally for all built-in chains to make sure that the added rules do not conflict with the rules created by firewalld. 

    priority="priority"

The priority is used to order rules. Priority 0 means add rule on top of the chain, with a higher priority the rule will be added further down. Rules with the same priority are on the same level and the order of these rules is not fixed and may change. If you want to make sure that a rule will be added after another one, use a low priority for the first and a higher for the following. 

The args can be any arguments of iptables or ip6tables, that do not conflict with the table or chain attributes. 

## passthrough

Is an optional element tag and can be used several times. It can be used to add rules to a built-in or added chain. A rule entry has exactly one attribute: 

    ipv="ipv4|ipv6|eb"

The IP family where the passthrough rule will be added. This can be either ipv4, ipv6 or eb. 

The args can be any arguments of iptables or ip6tables. 

The passthrough rule will be added to the chain directly. There is no mechanism like for the direct rule above. The user of the passthrough rule has to make sure that there will be no conflict with the rules created by firewalld.