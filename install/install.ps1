$AliasName = "brlogs"
$RepoDir = "$PSScriptRoot\.."
$WrapperPath = "$env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\$AliasName.bat"
$SourceScript = "$RepoDir\run.bat"
$UserDataDir = "$env:USERPROFILE\.brainlogs"

if ($args.Count -gt 0 -and $args[0] -eq "uninstall") {
    Write-Host "This will remove the shortcut command '$AliasName' from $WrapperPath."
    $yn = Read-Host "Are you sure you want to uninstall? (y/n)"
    if ($yn -match '^[Yy]') {
        if (Test-Path $WrapperPath) {
            Remove-Item $WrapperPath -Force
            Write-Host "Uninstall complete. Shortcut removed."
        } else {
            Write-Host "No shortcut found at $WrapperPath. Nothing to remove."
        }
    } else {
        Write-Host "Aborted. No changes made."
    }
    exit
}

if ($args.Count -gt 0 -and $args[0] -eq "purge") {
    Write-Host "This will remove the shortcut command '$AliasName' from $WrapperPath and delete all user data at $UserDataDir."
    Write-Host "Paths to be removed:"
    Write-Host "  Shortcut: $WrapperPath"
    Write-Host "  User data directory: $UserDataDir"
    $yn = Read-Host "Are you sure you want to fully uninstall and delete all data? (y/n)"
    if ($yn -match '^[Yy]') {
        if (Test-Path $WrapperPath) {
            Remove-Item $WrapperPath -Force
            Write-Host "Shortcut removed."
        } else {
            Write-Host "No shortcut found at $WrapperPath. Nothing to remove."
        }
        if (Test-Path $UserDataDir) {
            Remove-Item $UserDataDir -Recurse -Force
            Write-Host "User data directory removed."
        } else {
            Write-Host "No user data directory found at $UserDataDir. Nothing to remove."
        }
        Write-Host "Full uninstall complete."
    } else {
        Write-Host "Aborted. No changes made."
    }
    exit
}

Write-Host "Preparing to add a shortcut command '$AliasName' to $WrapperPath."
Write-Host "Target script: $SourceScript"
$yn = Read-Host "Do you want to continue? (y/n)"
if ($yn -match '^[Yy]') {
    Write-Host "Copying $SourceScript to $WrapperPath..."
    Copy-Item -Path $SourceScript -Destination $WrapperPath -Force
    # On Windows, .bat files are executable by default, but warn if not
    if (Test-Path $WrapperPath) {
        Write-Host "Done. You can now run '$AliasName' from anywhere."
        Write-Host "Ensure MicrosoftApps is in your PATH. If you get a permission error, check file properties and unblock if needed."
    } else {
        Write-Host "Failed to create shortcut. Please check permissions."
    }
} else {
    Write-Host "Aborted. No changes made."
    exit
}
