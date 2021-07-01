# GitOps / kustomize

## Structure

### 1. applications
Reusable applications that can be referenced through namespace definitions.
### 2. base
Basic setup, e.g. network policies and secrets, to be reused by every namespace.
### 3. namespaces
Definitions/content for a specific namespace - consumed by [flux](namespaces/.flux.yaml "consumed through flux manifest factorization").
### 4. resources
Centralized resource quota and limits for each namespace.
### 5. route
Ingress and Egress definitions for the cluster.


## Tips

> If you are adding new components to your repository, validate them with `kustomize build --load-restrictor LoadRestrictionsNone --reorder none . | kubectl apply --dry-run=client --validate=true -f -` against your Kubernetes cluster before commiting to Git. If you are using Kubernetes Custom Resource Definitions (CRDs), --dry-run will return: 'unable to recognize "STDIN": no matches for kind ...', as the resource is not yet visible on the cluster.
