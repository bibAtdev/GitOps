@ECHO OFF

TITLE Script to automatically install a Kubernetes cluster and enable GitOps via FluxCD

REM Installation of Kubernetes cluster
cd %~dp0
Call virtualbox-kubernetes/install.bat
if %errorlevel% neq 0 exit /b %errorlevel%

REM Installation of Flux CD on the Kubernetes cluster
cd %~dp0
Call fluxcd/install.bat
if %errorlevel% neq 0 exit /b %errorlevel%

cd %~dp0
echo "INFO: Installation of all components successfully finished."
