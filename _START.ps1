# Starts main setup as administrator
Start-Process powershell.exe -Verb Runas "$PSScriptRoot\install-ubuntu.ps1"