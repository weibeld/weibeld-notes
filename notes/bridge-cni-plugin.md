---
created: 2023-03-16T02:57:06+01:00
edited: 2023-03-26T17:00:54+02:00
title: "CNI Plugin 'bridge'"
---

Notes about the [`bridge`](https://www.cni.dev/plugins/current/main/bridge/) CNI plugin (see [GitHub](https://github.com/containernetworking/plugins/tree/main/plugins/main/bridge)):

ADD in `bridge` plugin:

- Creates a bridge if it doesn't exist ('ip link add cni0 type bridge', 'ip link set cni0 up'): setupBridge(), ensureBridge()
- Creates veth pair, moves one end to host netns other to Pod netns, enables both devices: setupVeth()
- Call IPAM plugin with identical argumnets (env vars and NetConf), save result
- Add 'routes' field to IPAM response with default route to bridge: calcGateways()
- Add IP address from IPAM result to Pod-end of veth pair: ConfigureIface() (github.com/containernetworking/plugins/pkg/ipam)
- Create routes that was added to IPAM response in Pod netns (default route to bridge): ConfigureIface() (github.com/containernetworking/plugins/pkg/ipam) => solves 2.1
- Add IP address to bridge: ensureAddr()
- Set the hardware address of the bridge: ensureAddr()
- Enable IP forwarding (write "1" into /proc/sys/net/ipv4/ip_forward): enableIPForward()
- Install iptables rules: setupIPMasq() (github.com/containernetworking/plugins/pkg/ip)
  - POSTROUTING chain in "nat" table: ACCEPT packets from Pod network (on this host) to Pod network (on this host) => solves 2.2
  - POSTROUTING chain in "nat" table: MASQUERADE packets from Pod network (on this host) to anywhere (except multicast address 224.0.0.0/4) => solves 2.4

`bridge` plugin:

- 'interfaces' field of result includes 'name' and 'mac' (https://github.com/containernetworking/plugins/blob/655116585396cc26ca973db2d5daef66d821ad90/plugins/main/bridge/bridge.go#L346)
- 'interfaces' field of result includes all three interfaces: Pod-end of veth pair, host-end of veth pair, and bridge
- 'ips' and 'routes' field or result is directly taken from IPAM result
