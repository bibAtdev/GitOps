@ECHO ON

TITLE Kubernetes Cluster automated restore of Vagrant VMs

REM Restore of Virutal Machines via Vagrant.
REM WARNING: VMs have to be create once before they can be restored.
cd %~dp0 && cd virtualbox-kubernetes ^
  && vagrant snapshot restore k8s-master VM_SNAPSHOT_GITOPS ^
  && vagrant snapshot restore k8s-worker-1 VM_SNAPSHOT_GITOPS ^
  && echo --- ^
  && echo "INFO: Kubernetes Cluster ist now available on Host system via 'kubectl'."
