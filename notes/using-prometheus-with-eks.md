---
created: 2023-03-17T18:39:42+01:00
edited: 2023-03-17T18:41:02+01:00
title: Using Prometheus with EKS
---

## Make Prometheus configuration work with an EKS cluster

This refers to https://github.com/prometheus-up-and-running/examples/blob/master/9/prometheus-deployment.yml

Note: it is assumed that the EKS cluster has been created with eksctl.

## Make the kubelet and cadvisor jobs work

By default, the scrapes to the kubelet and cadvisor targets fail with 401 Unauthorized.

The same configuration works with a Docker for Mac Kubernetes cluster.

*Background: for the `node` role, the Kubernetes Service Discovery returns a target for the kubelet on each worker node. The IP address of the target is the private IP address of the EC2 instance and the port is 10250 (the default port of the kubelet).*

- Add `bearer_token_file` to the scrape config
  - The kubelet does authentication and authorisation in the same way as the API server. Thus, requests to the kubelet must include an Authorization header with a Bearer Token.
- Add the `nodes/metrics` resource to the ClusterRole for the `prometheus` service account
  - To query the `/metrics` endpoint of the kubelet, apparently permission for this subresource is needed

Note: you don't need to open any ports on the EC2 instances, because they are already opened by the security groups created by eksctl for traffic from the security group that is used for worker nodes in the cluster. Since Prometheus runs on a worker node in the cluster, it is allowed to make requests to the kubelet on any of the worker nodes.

Note: for an EKS cluster, you can outcomment `insecure_skip_verify: true` as verification of the server certificate works with an EKS cluster. For a Minikube and Docker for Mac Kubernetes cluster, however, TLS server certificate verification doesn't work as expected, and `insecure_skip_verify: true` is needed.

> If you don't use `insecure_skip_verify: true` with Minikube and Docker for Mac, the scrapes fail with a `x509: cannot validate certificate for 10.0.2.15 because it doesn't contain any IP SANs` error.

## Make the k8sapiserver job work 

By default, scrapes fail with 403 Forbidden.

If you do the same with `curl` from within the cluster, you get `forbidden: User "system:serviceaccount:default:prometheus" cannot get path "/metrics"`.

This is because the `prometheus` ServiceAccount does not have permission to query the `/metrics` endpoint of the API server.

To grant this permission to the `prometheus` ServiceAccount, add the following to the `prometheus` ClusterRole:

```yaml
- nonResourceURLs:
  - /metrics
  verbs: ["get"] 
```
