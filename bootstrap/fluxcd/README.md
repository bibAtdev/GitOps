
# Fux-CD for GitOps
GitOps Infrastructure-as-Code (IaC) for the deployment of FluxCD to a Kubernetes (k8s) cluster.

## Description
This repository contains files to deploy FluxCD to a Kubernetes cluster via Terraform and `kubectl`. Thereby Terraform installs FluxCD on the Kubernetes cluster and links it to a Git repository, so that you are getting a fully functioning GitOps architecture.

## Architecture

```mermaid
graph LR
A[Kubernetes Cluster] --> B((Terraform))
B --> C[FluxCD installed]
C --> D((Terraform))
D --> E[Flux linked to Git reporisotry]
```

## Prerequirements

### Minimum free Kubernetes cluster resources
| Resource | Quantity  |
|--|--|
| vCPUs | 0.5 |
| RAM | 500 MB |

### Software Requirements
| Software | Latest tested Version |
|--|--|
| Terraform | 0.14.3 |
| kubectl| 1.20.1 |

## How To
1. Install [Terraform](https://www.terraform.io) and [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
> On Windows you can use the command-line installer [Scoop]( https://scoop.sh ) to install all the required components.

2. Make sure your Kubernetes cluster is available via `kubectl` by executing `kubectl get nodes`. The output should look similar like this:
```
$ vagrant ssh k8s-master
vagrant@k8s-master:~$ kubectl get nodes
NAME           STATUS   ROLES                  AGE     VERSION
k8s-master     Ready    control-plane,master   27m     v1.19.6
k8s-worker-1   Ready    <none>                 7m48s   v1.19.6
```
3. Set the required Git Parameters in your shell:
```
TF_VAR_github_owner=YourGitHubUser
TF_VAR_github_token=YourGitHubToken
```
> The Github token should contain create, write, read, and delete rights

4. Execute the `install.bat`, which is available within this directory.

5. To verify that the installation was successful execute `kubectl get pods -n flux-system`. If you should get an output similar like this:
```
$ kubectl get pods -n flux-system
NAME                                       READY   STATUS    RESTARTS   AGE
helm-controller-6765c95b47-b99sz           1/1     Running   0          2m
kustomize-controller-7f5455cd78-2w2ts      1/1     Running   0          2m
notification-controller-694856fd64-8gdtk   1/1     Running   0          2m
source-controller-5bdb7bdfc9-ctlpp         1/1     Running   0          2m
```

 

### Latest tested Components

| Component | Version  |
|--|--|
| Docker |  19.03.13|
| Kubernetes | 1.19.6 |
| kubectl | 1.20.1 |
| Terraform| 0.14.3 |
| Terraform Provider Flux| 0.0.8 |
| Windows | Windows 10 Build 19041.685 |



## Known issues
| Topic | Description  | Workaround | Related Articles  |
|--|--|--|--|
| FluxCD ManifestFile path error on Windows | Currently the automated linking between FluxCD and the defined Git repository is not working on Windows| - |  [fluxcd#645](https://github.com/fluxcd/flux2/issues/645)


## Further Readings
* [FluxCD]( https://fluxcd.io )
* [FluxCD Terraform Provider]( https://github.com/fluxcd/terraform-provider-flux )
* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
* [Terraform Registry]( https://registry.terraform.io/providers/fluxcd/flux/latest/docs  )


## Key Words
* Infrastructure-as-Code (IaC)
* GitOps
* FluxCD
* Kubernetes
* Terraform
* Docker

## ToDo
* Open a pull request at the [FluxCD Terraform Provider]( https://github.com/fluxcd/terraform-provider-flux ) to support the linking of already existing Git repositories to FluxCD

## Author
Andreas Biberacher < bibatdevelopment@gmail.com >

Feel free to open discussions and pull requests :nerd_face:
