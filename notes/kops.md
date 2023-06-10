---
created: 2023-03-17T18:59:27+01:00
edited: 2023-03-17T19:00:36+01:00
title: kOps
---

## Basic information about kOps

[kOps](https://kops.sigs.k8s.io/) cluster with default settings (1 master node and 2 worker nodes) creates 21 AWS resources in the region in which the cluster is created (counted in Tag Editor).

kops uses [nodeup](https://github.com/kubernetes/kops/blob/master/pkg/model/resources/nodeup.go) instead of kubeadm.

Explanations about how kops works: https://kubernetes-kops.netlify.app/boot-sequence/

If creating Terraform output (`--target terraform`), the kubeconfig is created before the creation of any resources (after kops create cluster).
