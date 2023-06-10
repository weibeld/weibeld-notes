---
created: 2023-03-17T19:08:12+01:00
edited: 2023-03-17T19:09:06+01:00
title: 'Pod Phase, Pod Condition, Container State'
---

Overview of pod and container lifecycle states and conditions.

## Pod phase

- Pending
- Running
- Succeeded
- Failed
- Unknown

See <https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-phase>

## Container state

- Waiting
- Running
- Terminated

See:

- <https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-states>
- <https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.21/#containerstate-v1-core>

## Pod conditions

- PodScheduled
- Initialized
- ContainersReady
- Ready

See: <https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-conditions>
