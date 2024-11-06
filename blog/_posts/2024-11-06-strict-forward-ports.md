---
layout: post
title: "Strict Forward Ports"
section: Blog
date: 2024-11-06T12:00:00
author: Eric Garver
---

## Introduction

When Docker (or Podman) publishes container ports, the published ports
are honored by firewalld. In some cases, users want firewalld to be
strict and block those ports. This has been outlined in a [previous post]({% post_url /blog/2024-03-22-strictly-filtering-docker-containers %}).

Firewalld now supports `StrictForwardPorts` which allows users to block
published container ports.

## Configuration

The behavior is configurable by changing `StrictForwardPorts` in
`/etc/firewalld/firewalld.conf`.

`/etc/firewalld/firewalld.conf`:
```
# StrictForwardPorts
# If set to yes, the generated destination NAT (DNAT) rules will NOT accept
# traffic that was DNAT'd by other entities, e.g. docker. Firewalld will be
# strict and not allow published container ports until they're explicitly
# allowed via firewalld.
# If set to no, then docker (and podman) integrates seamlessly with firewalld.
# Published container ports are implicitly allowed.
# Defaults to "no".
StrictForwardPorts=no
```

## Forwarding Ports with StrictForwardPorts=yes

When `StrictForwardPorts=yes`, the user must explicitly forward ports to
containers using firewalld. All `--published` ports will be blocked.

Since the containers IP address will change every time the container is
started, a forward port should be added at runtime. Luckily docker
provides a way to get the container's address programmatically.

Example to forward `8080` to a container's port `80`.

```
# CONTAINER_IP=$(docker inspect -f '{% raw %}{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}{% endraw %}' <container_name>)
# firewall-cmd --zone public --add-forward-port=port=8080:proto=tcp:toport=80:toaddr=${CONTAINER_IP}
```

## What it Looks Like

This feature works by altering the underlying firewall rules that accept
DNAT'd connections.

With `StrictForwardPorts=no`, there is a top-level and generic accept of
all DNAT'd connections. This is the rule that would allow `--published`
ports.

```
table inet firewalld {
    chain filter_FORWARD {
        ct state established,related accept
        ct status dnat accept   <--- THIS RULE
        [..]
    }
}
```

With `StrictForwardPorts=yes`, the generic is replaced by a rule per
forward-port that accepts _only_ those ports for which firewalld has
explicit configuration. It block all other DNAT'd traffic.

```
table inet firewalld {
    chain filter_FORWARD {
	ct state established,related accept
	ct status dnat jump filter_FORWARD_dnat   <--- CHANGED RULE
	[..]
    }
}

table inet firewalld {
    chain filter_FORWARD_dnat {
	ct original proto-dst 8080 accept    <--- ONE PER forward-port
	reject with icmpx admin-prohibited
    }
}
```

## Conclusion

This new configuration knob gives users more control over container
traffic. The default behavior has not changed. That is, firewalld and
docker (podman) integration is still seamless by default. Users that
want strict control now have a configuration option to get the behavior
they desire.

## Bugs Referencing This Topic

This topic has been discussed and referenced in numerous reports.

- [How to manage docker exposed port by firewall-cmd?](https://github.com/firewalld/firewalld/issues/869)
- [Podman and Firewalld: Port Forwarding through the Firewall](https://github.com/firewalld/firewalld/issues/1380)
