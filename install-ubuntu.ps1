# Enabling Windows features
Write-Host "`n[script] Watch this window for special instructions"
Write-Host "[script] When asked, your Ubuntu username is your first_initial.lastname`n"

pause

Write-Host "`n[script] Enabling Windows features ..."
Enable-WindowsOptionalFeature -Online -NoRestart:$False -FeatureName Microsoft-Windows-Subsystem-Linux *>$null

# Installing bash & ubuntu
Write-Host "[script] Installing & setting up Ubuntu 16.04 ... "
lxrun /install /y *>$null 

Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.zip -UseBasicParsing *>$null
Expand-Archive ~/Ubuntu.zip ~/Ubuntu *>$null
Remove-Item -path ~/Ubuntu.zip

Write-Host "[script] Close Ubuntu bash window after username & password creation"

Start-Process -FilePath "~/Ubuntu/ubuntu.exe" -wait

# Bash setup
$ubuntuUsername = Read-Host -Prompt 'Repeat your UNIX username '

bash "/mnt/c/Users/$ubuntuUsername/Desktop/ubuntu-setup/setup-bash.sh" "$ubuntuUsername"

Write-Host "`n`n[script] Setup is complete"

pause