---
created: 2023-03-17T19:06:22+01:00
edited: 2023-03-17T19:06:32+01:00
title: Kubernetes Core Features
---

What features does the core of Kubernetes provide compared to running containers manually on physical machines or VMs?

> Note: this overview does not cover features and benefits introduced by using containers per se compared to using bare processes (dependency encapsulation, isolation, resource usage control, etc.). It also doesn't cover features provided by components that can be optionally added to Kubernetes but are not part of a typical vanilla Kubernetes installation (service mesh, inter-cluster networking, etc.), as well as features targeting Kubernetes itself (authentication and authorisation for the Kubernetes API, definition of custom API resources, etc.). The focus of this overview is the set of features that are firmly built into Kubernetes and provided out of the box.

## Scheduling

Selection of a node based on the resource requirements of the containers in a Pod, manually defined affinities, storage volume availability, etc.

Rescheduling of Pods on incidents, e.g. node failures. Hierarchy of scheduling priorities for Pods and scheduling, preemption/rescheduling based on priority.

Implemented by: kube-scheduler, resource limits in PodSpec, affinity/anti-affinity inPodSpec, priority in PodSpec

## Monitoring and restarting

Detection when a container crashes and immediate restarting of the container.

Implemented by: kubelet

## Probing

User-defined probes for detecting whetehr a container for detecting whethera container is responsive (liveness probe) or ready to receive traffic (readiness probe).

Implemented by: liveness/readiness probes in PodSpec

## Load balancing

Automatic establishment of fixed IP address for a replicated service and keeping list of backends up-to-date.

Implemented by: kube-proxy, Service

## Storage

Automatic attachment of persistent storage solutions into containers. Management of these storage volumes, and reattachment when a Pod is rescheduled.

Implemented by: CSI, PersistentVolume/PersistentVolumeClaim

## Pod networking

Automatic setup of network interfaces in Pods, management of IP addresses, and ensuring reachabiliy of Pods from other Pods in a cluster. Support for different intra-cluster Pod network topologies (e.g. encapsulated, unencapsulated) through a plugin model.

Support for defninig firewall rules (allowing or restricting traffic) between groups of Pods.

Implemented by: CNI, network policies

## DNS service discovery

Automatic operation of a DNS server in the cluser, configuration of all containers to use this DNS server. Automatic management of DNS records for Service and other permanent resources.

Implemented by: kube-dns

## Ingress networking

Automatic configuration of reverse proxies running inside the cluster for routing incoming traffic to services. Integration with cloud providers and other infrastructure for providing a permanent access point outside the cluster (load balancer) for traffic to reach the cluster.

Implemented by: Ingress, LoadBalancer Service

## Application lifecycle models

Support for different application deployment and update models, such as rolling updates, blue-green deployments, canary deployments, node daemon operation, support for stateful applications.

Implemented by: Deployment, DaemonSet, StatefulSet

## Metric collection

Automatic resource metrics collection (CPU and memory) of all containers. Exposition of these metrics through APIs. Support for collecting custom metrics and exposing them through the same APIs.

Implemented by: cAdvisor, Metrics Server, Resource Metrics API, Custom Metrics API

> Note: this is an optional component that is not enabled by default.

## Autoscaling

Horizontal scaling of groups of Pods based on metrics from the metrics APIs. Vertical scaling of containers' resource requirements and limits based on actual resource usgae.

Implemented by: HorizontalPodAutoscaler, VerticalPodAutoscaler

## Policies

Support for predefined and custom policies for deployed applications and other resources (for compliance, security, robustness, etc.).

Implemented by: admission controllers (including ValidatingWebhookController and MutatingWebhookController for custom policies)

## Control loop

Support for watching any resource in the cluser for changes and reacting on it accordingly.

Implemented by: etcd, API server, controller and operator patterns
