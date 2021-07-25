@ECHO ON

TITLE FluxCd automated setup on Windows

REM Installation of Flux CD on the Kubernetes cluster
cd %~dp0 ^
  && terraform destroy -auto-approve ^
  || del *terraform*

cd %~dp0flux_install ^
  && terraform init ^
  && terraform apply -auto-approve ^
  && echo "INFO: Installation of fluxcd on Kubernetes cluster was successful."
  
if %errorlevel% neq 0 exit /b %errorlevel%

REM Linking Flux CD to a Git repository
cd %~dp0flux_sync ^
  && terraform init ^
  && terraform apply -auto-approve ^
  && echo "INFO: Linking of Flux CD to Git repository was successful."
if %errorlevel% neq 0 exit /b %errorlevel%
