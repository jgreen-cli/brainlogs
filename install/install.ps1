$AliasName = "brlogs"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$WrapperPath = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\$AliasName.bat"

# Points to the new run.ps1
$TargetScript = "$ScriptDir\..\run.ps1"
$WrapperContent = "@echo off`npowershell -ExecutionPolicy Bypass -File `"$TargetScript`" %*"

Set-Content -Path $WrapperPath -Value $WrapperContent -Encoding ASCII
Write-Host "✅ Alias '$AliasName' installed at $WrapperPath"
Write-Host "ℹ️ Make sure '$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps' is in your PATH"
