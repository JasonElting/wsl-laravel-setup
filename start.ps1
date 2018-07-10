$path = (Get-Item -Path '.\' -Verbose).FullName + "\install-ubuntu.ps1"

Start-Process powershell.exe -Verb Runas $path