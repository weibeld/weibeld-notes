---
created: 2023-03-17T18:45:49+01:00
edited: 2023-03-17T18:48:57+01:00
title: Kubernetes Assistance Projects
---

List of projects that assist in the usage of Kubernetes.

## Interactive Kubernetes usage

- https://github.com/cloudnativelabs/kube-shell
    - Kubernetes shell with standard kubectl commands, auto-complete, fuzzy search, etc. (1061 stars)
- https://github.com/c-bata/kube-prompt
    - Kubernetes shell with standard kubectl commands, auto-complete, etc. (791 stars)
- https://github.com/astefanutti/kubebox
    - CLI-based Kubernetes dashboard/interface (523 stars)
- https://github.com/errordeveloper/kubeplay
    - Kubernetes shell defining its own language (78 stars)

## kubectl enhancements

- https://github.com/GoogleContainerTools/krew
    - Package manager for kubectl plugins, from Google (303 stars)
- https://github.com/Shopify/kubernetes-deploy
    - Alternative to `kubectl apply` with more information, from Shopify (650 stars)
- https://github.com/ahmetb/kubectx
    - Commands for changing the active context and namespace for kubectl (3020 stars)
- https://github.com/ahmetb/kubectl-aliases
    - Auto-generated kubectl shell aliases (424 stars)
- https://github.com/kubermatic/fubectl
    - kubectl shell aliases using fuzzy searching (fzf) (133 stars)
- https://github.com/arunvelsriram/kube-fzf
    - Wrapper commands around some kubectl commands using fuzzy search (fzf) (51 stars)

## Health checks for cluster and configuration

- https://github.com/Shopify/kubeaudit
    - Perform a set of security checks on a cluster, from Shopify (305 stars)
- https://github.com/zegl/kube-score
    - Check Kubernetes YAML configuration files for common pitfalls (285 stars)
- https://github.com/cloud66-oss/copper
    - Check Kubernetes YAML configuration files for common pitfalls, customisable (97 stars)

## Development

- https://github.com/windmilleng/tilt
    - Automatically rebuild and deploy containers in cluster from local file changes (1735 stars)
- https://github.com/vapor-ware/ksync
    - Automatically rebuild container images and restart containers on cluster from file changes on local machine (377 stars)
- https://github.com/solo-io/kubesquash
    - Attach debugger to running pods in cluster (193 stars)
- https://github.com/wercker/stern
    - Combine pods from multiple pods and containers (1501 stars)

## Discover Kubernetes internals

- https://github.com/pulumi/kubespy
    - Report the internal status changes of Kubernetes resources, great for learning how Kubernetes works under the hood (1504)
- https://github.com/vmware/purser
    - Watch for resource interactions, allocations, etc. inside the cluster and make this information accessible via a kubectl plugin, from VMware (29 stars)

## Misc

- https://github.com/kubernetes-sigs/kustomize (now part of kubectl!)
    - Text processor for modifying Kubernetes YAML configuration files, from Kubernetes SIG CLI (1681 stars)
- https://github.com/kubernetes-sigs/kind
    - Run Kubernetes locally, Kubernetes components run in Docker containers (Kubernetes in Docker), from Kubernetes SIG Testing (777 stars)
- https://github.com/pieterlange/kube-backup/
    - Back up Kubernetes state to Git (209 stars)
- https://github.com/mhausenblas/kubed-sh
    - Simulate a shell that runs inside the cluster for directly running binaries in the cluster (71 stars)

## Specialised applications

- https://github.com/Soluto/kamus
    - Component running in cluster (and CLI client) for encrypting secrets that can only be decrypted by another app running in cluster (77 stars)
- https://github.com/bincyber/pkictl
    - Deploy a public key infrastructure (PKI) to the cluster, allows declarative definition of PKI (27 stars)
- https://github.com/fntlnz/kubectl-trace
    - kubectl plugin for scheduling bpftrace executions (12 stars)
- https://github.com/theMagicalKarp/kube-janitor
    - Delete pods of finished jobs (`Job` resource), deployed to the cluster (10 stars)

## Not specific to Kubernetes

- https://github.com/vmware/tern
    - Generate list of packages installed in a Docker image (not Kubernetes-specific), from VMware (190 stars)
- https://github.com/lirantal/dockly
    - CLI dashboard/interface for the running containers on a machine (not Kubernetes-specific) (1561 stars)
