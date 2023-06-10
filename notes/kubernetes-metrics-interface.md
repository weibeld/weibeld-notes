---
created: 2023-03-17T18:55:12+01:00
edited: 2023-03-17T20:02:48+01:00
title: Kubernetes Metrics Interface
---

Overview of the Kubernetes internal API for exposing metrics. This API is intended for clients such as the Horizontal Pod Autoscaler (HPA) which need to have a standardised way for querying metrics from Kubernetes.

## Resource metrics pipeline

- Provides a limited set of default metrics
    - CPU, memory, and storage usage of nodes
    - CPU, memory, and storage usage of pods
- Documentation
    - https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/#resource-metrics-pipeline
    - https://kubernetes.io/docs/tasks/debug-application-cluster/resource-metrics-pipeline/
- Metrics are provided through the **Metrics API** on `/apis/metrics.k8s.io/v1beta1` (like any other API)
    - https://kubernetes.io/docs/tasks/debug-application-cluster/resource-metrics-pipeline/#the-metrics-api
    - https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/resource-metrics-api.md
- Metrics are collected and exposed through the Metrics API by the **metrics-server**
    - https://kubernetes.io/docs/tasks/debug-application-cluster/resource-metrics-pipeline/#metrics-server
    - https://github.com/kubernetes-incubator/metrics-server
    - https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/metrics-server.md
- The metrics-server is "plugged-in" to the API server, which allows the Metrics API to be exposed like any other Kubernetes API
    - This is done through the [Kubernetes aggregation layer](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/)
- The metrics-server averages metrics over 1 minute time windows
- The metrics-server keeps the last value of each metric in memory
- Metrics for each node are provided to the metrics-server by the kubelet through the **kubelet resource metrics API** or **kubelet summary API**
    - This API is served at `/metrics/resource/v1alpha1` on the kubelet
- The kubelet gets this usage data from **cAdvisor**
    - https://github.com/google/cadvisor
    - https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/#cadvisor
- cAdvisor collects resource usages (CPU, memory, etc.) of all containers running on the machine
- cAdvisor is included in the kubelet binary

### metrics-server

- The metrics-server is maintained here: <https://github.com/kubernetes-incubator/metrics-server>
- It can be deployed to a cluster by the configuration in <https://github.com/kubernetes-incubator/metrics-server/tree/master/deploy/1.8%2B>
- These are the same files as by the Spring Boot Autoscaling tutorial in <https://github.com/learnk8s/spring-boot-k8s-hpa/tree/master/monitoring/metrics-server>
    - The tutorial uses metrics-sever 0.2 whereas the newest version is 0.3
    - How to deploy the metrics-server is described [here](https://learnk8s.io/blog/scaling-spring-boot-microservices/#consuming-application-metrics-in-kubernetes) in the article

### Metrics API

#### NodeMetrics

```yaml
apiVersion:
kind:
metadata:
  name:
  selfLink:
  creationTimestamp:
timestamp:
window:
usage:
  cpu: 24749665n
  memory: 447932Ki
```

#### NodeMetricsList

```yaml
apiVersion:
kind:
metadata:
  selfLink:
  resourceVersion:
  continue:
  remainingItemCount:
items:
  - metadata:
      name:
      selfLink:
      creationTimestamp:
    timestamp:
    window:
    usage:
      cpu: 24749665n
      memory: 447932Ki
  - ...
```

#### ContainerMetrics

```yaml
name:
usage:
  cpu: 877726n
  memory: 11472Ki
```

#### PodMetrics

```yaml
apiVersion:
kind:
metadata:
  name: <pod name>
  namespace: <pod namespace>
  selfLink:
  creationTimestamp:
timestamp:
window:
containers:
  - name:
    usage:
      cpu: 877726n
      memory: 11472Ki
  - ...
```

#### PodMetricsList

```yaml
apiVersion:
kind:
metadata:
  selfLink:
  resourceVersion:
  continue:
  remainingItemCount:
items:
  - metadata: <pod name>
      name: <pod namespace>
      namespace:
      selfLink:
      creationTimestamp:
    timestamp:
    window:
    containers:
      - name:
        usage:
          cpu: 877726n
          memory: 11472Ki
  - ...
```


## Custom metrics pipeline

- Overview of adapter solutions that provide the Custom Metrics API: https://github.com/kubernetes/metrics/blob/master/IMPLEMENTATIONS.md#custom-metrics-api
- Walkthrough: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics


## References

- Kubernetes in Action
    - Chapter 15: Automatic scaling of pods and cluster nodes
- Managing Kubernetes
    - Chapter 11: Monitoring Kubernetes
- Cloud-Native DevOps with Kubernetes
    - Chapter 15: Observability and Monitoring
    - Chapter 16: Metrics in Kubernetes
