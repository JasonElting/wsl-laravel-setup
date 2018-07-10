# Enabling Windows features
Write-Host "`n[script] Enabling features ..."
Enable-WindowsOptionalFeature -Online -NoRestart:$False -FeatureName Microsoft-Windows-Subsystem-Linux *>$null

# Installing bash & ubuntu
Write-Host "[script] Installing Ubuntu bash ..."
lxrun /install /y *>$null

#Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.zip -UseBasicParsing *>$null
Expand-Archive ~/Ubuntu.zip ~/Ubuntu *>$null
Start-Process -FilePath "~/Ubuntu/ubuntu.exe" -wait

# Bash setup
bash
sudo apt-get update
sudo apt-get upgrade