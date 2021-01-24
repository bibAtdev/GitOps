@ECHO OFF

TITLE Script to automatically install a Kubernetes cluster and enable GitOps via FluxCD

REM Installation of Kubernetes cluster
cd %~dp0
Call virtualbox-kubernetes/install.bat
if %errorlevel% neq 0 exit /b %errorlevel%

REM Creating SNAPSHOTS of VMs
cd %~dp0 && cd virtualbox-kubernetes ^
  && vagrant snapshot save k8s-master VM_SNAPSHOT_PLAIN_K8S ^
  && vagrant snapshot save k8s-worker-1 VM_SNAPSHOT_PLAIN_K8S

REM Installation of Flux CD on the Kubernetes cluster
cd %~dp0
Call fluxcd/install.bat
if %errorlevel% neq 0 exit /b %errorlevel%

REM Creating SNAPSHOTS of VMs
cd %~dp0 && cd virtualbox-kubernetes ^
  && vagrant snapshot save k8s-master VM_SNAPSHOT_GITOPS ^
  && vagrant snapshot save k8s-worker-1 VM_SNAPSHOT_GITOPS

cd %~dp0
echo "INFO: Installation of all components successfully finished."
