$AliasName = "brlogs"
$RepoDir = "$PSScriptRoot\.."
$WrapperPath = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\$AliasName.bat"
$SourceScript = "$RepoDir\run.bat"

Copy-Item -Path $SourceScript -Destination $WrapperPath -Force
Write-Host "Alias '$AliasName' installed at $WrapperPath"
Write-Host "Ensure MicrosoftApps is in your PATH"
