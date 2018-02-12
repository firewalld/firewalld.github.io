---
layout: page
title: "Runtime versus Permanent"
--- 

The configuration is separated into the runtime and the permanent configuration.

## Runtime Configuration

The runtime configuration is the actual effective configuration and applied to the firewall in the kernel. At firewalld service start the permanent configuration becomes the runtime configuration. Changes in the runtime configuration are not automatically saved to the permanent configuration.

The runtime configuration will be lost with a firewalld service stop. A firewalld reload will replace the runtime configuration by the permanent configuration. Changed zone bindings will be restored after the reload.

## Permanent Configuration

The permanent configuration is stored in config files and will be loaded and become new runtime configuration with every machine boot or service reload/restart.

## Runtime to Permanent

The runtime environment can also be used to create a firewall setup that fits the needs. When it is complete and working it can be migrated with the runtime to permanent migration. It is available in `firewall-config` and `firewall-cmd`.

The firewall-cmd is:

    firewall-cmd --runtime-to-permanent

If the firewall setup is not working, a simple firewalld reload/restart will reapply the working permanent configuration.
