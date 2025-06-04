$AliasName = "brlogs"
$TargetScript = "PSScriptRoot\..\brainlogs\main.py"

# for wrapper
$WrapperPath = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\$AliasName.bat"
$WrapperContent = "@echo off`npython `"$TargetScript`" %*"

Set-Content -Path $WrapperPath -Value $WrapperContent -Encoding ASCII
Write-Host "Alias '$AliasName' installed at $WrapperPath"
Write-Host "Make sure this folder is in your PATH"
