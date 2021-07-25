@ECHO ON

TITLE Kubernetes Cluster automated shut down of Vagrant VMs

REM Restore of Virutal Machines via Vagrant.
REM WARNING: VMs have to be create once before they can be restored.
cd %~dp0 && cd virtualbox-kubernetes ^
  && vagrant halt k8s-master ^
  && vagrant halt k8s-worker-1 ^
  && echo --- ^
  && echo "INFO: Kubernetes Cluster was stopped successfully."
