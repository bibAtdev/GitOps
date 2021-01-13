@ECHO ON

TITLE FluxCd automated setup for Windows

REM Installation of Flux CD on the Kubernetes cluster
cd %~dp0 ^
  && terraform destroy -auto-approve ^
  || rm -rf *terraform*

cd %~dp0 ^
  && terraform init flux_install ^
  && terraform apply -auto-approve flux_install ^
  && echo "INFO: Installation of fluxcd on Kubernetes cluster was successful."
  
if %errorlevel% neq 0 exit /b %errorlevel%

REM Linking Flux CD to a Git repository
cd %~dp0 ^
  && terraform init flux_sync ^
  && terraform apply -auto-approve flux_sync ^
  && echo "INFO: Linking of Flux CD to Git repository was successful."
if %errorlevel% neq 0 exit /b %errorlevel%