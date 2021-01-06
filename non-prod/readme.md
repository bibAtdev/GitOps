# gitops / kustomize structure

## 1. applications
Reusable applications that can be referenced through namespace definitions.
## 2. base
Basic setup, e.g. network policies and secrets, to be reused by every namespace.
## 3. namespaces
Definitions/content for a specific namespace - consumed by [flux](namespaces/.flux.yaml "consumed through flux manifest factorization").
## 4. resources
Centralized resource quota and limits for each namespace.
## 5. route
Ingress and Egress definitions for the cluster.
