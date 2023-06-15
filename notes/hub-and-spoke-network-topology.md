---
created: 2023-06-14T22:24:13+02:00
edited: 2023-06-14T22:24:13+02:00
title: Hub and Spoke Network Topology
---

- Multiple spoke networks connected to the same hub network
  - In cloud environments (such as Azure), these networks are ususally peered (regional or global peering)
- Hub network contains common services
	- VPN Gateway, bastion host, firewall, etc.
- Spoke network contain actual workloads
- Traffic to and from the outside world passes through the hub network

## Resources

- https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/hub-spoke-network-topology
