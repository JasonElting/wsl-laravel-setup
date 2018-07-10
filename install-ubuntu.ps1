# Enabling Windows features
Write-Host "`n[script] Enabling Windows features ..."
Enable-WindowsOptionalFeature -Online -NoRestart:$False -FeatureName Microsoft-Windows-Subsystem-Linux *>$null

# Installing bash & ubuntu
Write-Host "[script] Installing & setting up Ubuntu ... "
lxrun /install /y *>$null

Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.zip -UseBasicParsing *>$null
Expand-Archive ~/Ubuntu.zip ~/Ubuntu *>$null
Start-Process -FilePath "~/Ubuntu/ubuntu.exe" -wait

Write-Host "[script] CLOSE BASH WINDOW WHEN DONE TO CONTINUE"

# Bash setup
$ubuntuUsername = Read-Host -Prompt 'Repeat your UNIX username'

bash "/mnt/c/Users/$ubuntuUsername/Desktop/ubuntu-setup/setup-bash.sh" "$ubuntuUsername"

Write-Host "`n[script] Copy Desktop/key.txt content to Bitbucket.org > User > Bitbucket Settings > SSH Keys"
Write-Host "[script] Setup has completed`n"
pause