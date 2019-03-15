---
layout: page
title: "Open a Port or Service"
---

There are different ways to open up a port (range) or service. These ways depend on the use case and the number of changes that are needed to make it work.

A simple port number or port range can be used in the cases where no additional changes are needed. For example, with opening port 80/tcp to allow access to a local http servicer on the standard port. For most of the more important services, there is already a service defined in firewalld. Then there is no need to know about the default port number(s). The service can then simply be enabled in the used zone.

If there is a need to open different ports or to do additional changes, then using a service might be simpler. If you need to add a new or custom service, then please have a look at the howto "[Add a Service](add-a-service.html)". It is also possible to adapt a builtin service according to the user's needs, for example to change one of the used ports. But it is recommended to generate a new service in this case to make it more obvious that the service has been customized.

## How to open port 80/tcp with firewall-cmd:

    firewall-cmd --zone=public --add-port=80/tcp

This will open the port 80 with protocol tcp in the public zone of the runtime environment. The runtime environment is only effective until the machine has been rebooted or the firewalld service has been restarted. The zone option can be omitted here if the port should be added to the default zone.

    firewall-cmd --permanent --zone=public --add-port=80/tcp

If you want to make this a permanent change also, then open the port also in the permanent environment. This means the port will be open also after a system reboot or firewalld service reload.

## How to open a service with firewall-cmd:

    firewall-cmd --zone=public --add-service=http

This opens the service in the public zone of the runtime environment.

    firewall-cmd --permanent --zone=public --add-service=http

This also opens the service in public zone of the permanent environment.

