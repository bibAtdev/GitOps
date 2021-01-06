@ECHO ON

TITLE Kubernetes Cluster automated setup for Windows

REM Installation of Virutal Machines via Vagrant
cd %~dp0 ^
  && vagrant destroy -f ^
  && vagrant up ^
  && echo "INFO: Setup of Kubernetes Cluster was successful."
if %errorlevel% neq 0 exit /b %errorlevel%

REM Linking Kubeconfig to kubectl on Host system.
REM Ref.: https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/
Set KUBECONFIG=%~dp0.kube\config

kubectl get pods --all-namespaces ^
  && echo --- ^
  && echo "INFO: Kubernetes Cluster ist now available on Host system via 'kubectl'."
if %errorlevel% neq 0 exit /b %errorlevel%
