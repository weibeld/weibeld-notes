---
created: 2023-03-17T19:55:33+01:00
edited: 2023-03-17T19:57:10+01:00
title: Kubernetes Persistent Volume Metrics
---

Overview of metrics that report the usage of Kubernetes PersistentVolumes.

> Note: some information is specific to the work at Swisscom (first project).

## Volumes

`volume_manager_total_volumes`: number of volumes of each type (configMap, secret, downwardAPI, emptyDir, hostPath, persistentVolumeClaim) on each node.

## Usage of PersistentVolumes

Usage of PersistentVolumes (see kube-prometheus "Persistent Volumes" dashboard):

- `kubelet_volume_stats_capacity_bytes`
- `kubelet_volume_stats_available_bytes`
- `kubelet_volume_stats_inodes`
- `kubelet_volume_stats_inodes_used`

However, when using the Ceph CSI plugin and StorageClass, these metrics are not exposed, see:

- https://github.com/rook/rook/issues/1659
- https://github.com/container-storage-interface/spec/issues/236
- https://github.com/ceph/ceph-csi/issues/1352
- https://github.com/prometheus-operator/prometheus-operator/issues/2359
- https://github.com/rook/rook/issues/4834
- https://github.com/kubernetes/kubernetes/issues/89733

The situation in the current cluster is described on https://github.com/ceph/ceph-csi/issues/1352#issuecomment-810596393. The error in the CephFS CSI driver logs occur only in the dev cluster, and there the `kubelet_volume_*` metrics are not expoed.

In the test cluster, the errors don't occur and indeed the `kubelet_volume_*` metrics are exposed.

The exposed metrics are: 

- `kubelet_volume_stats_available_bytes`
- `kubelet_volume_stats_capacity_bytes`
- `kubelet_volume_stats_inodes`
- `kubelet_volume_stats_inodes_free`
- `kubelet_volume_stats_inodes_used`
- `kubelet_volume_stats_used_bytes`

## Topology of PersistentVolumeClaims and PersistentVolumes

Which Pods use which PersistentVolumeClaims bound to which PersistentVolumes:

- `kube_persistentvolume_*`
- `kube_persistentvolumeclaim_*`
- `kube_pod_spec_volumes_persistentvolumeclaims_*`
- `kube_volumeattachment_*`

## Ceph cluster

Total Ceph cluster usage:

- ceph_cluster_total_bytes
- ceph_cluster_total_used_bytes

This is the total usage of the cluster and not broken down to Kubernetes-level PersistentVolumes.
