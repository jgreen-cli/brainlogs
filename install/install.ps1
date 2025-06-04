$UserDataDir = "$env:USERPROFILE\.brainlogs"
$ScriptDir = Split-Path -Parent $PSScriptRoot

if ($args.Count -gt 0 -and $args[0] -eq "purge") {
    Write-Host "This will delete all user data at $UserDataDir."
    Write-Host "Path to be removed: $UserDataDir"
    $yn = Read-Host "Are you sure you want to fully uninstall and delete all data? (y/n)"
    if ($yn -match '^[Yy]') {
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

# Add the parent directory (brainlogs) to the user's PATH
$UserPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
if ($UserPath -notlike "*$ScriptDir*") {
    [System.Environment]::SetEnvironmentVariable("Path", "$UserPath;$ScriptDir", "User")
    Write-Host "Added $ScriptDir to your user PATH. Restart your terminal to use 'brlogs' globally."
} else {
    Write-Host "$ScriptDir is already in your user PATH."
}
