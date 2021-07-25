@ECHO ON

TITLE Uninstall Vagrant VMs

REM Uninstall of Virutal Machines via Vagrant.
cd %~dp0 && cd virtualbox-kubernetes ^
  && for /f "tokens=1" %a in ('vagrant global-status --prune') do vagrant destroy %a -f ^
  && echo --- ^
  && echo "INFO: VMs are suspended."
