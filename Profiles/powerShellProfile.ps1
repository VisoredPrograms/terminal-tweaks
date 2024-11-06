# Initialize Starship prompt
Invoke-Expression (&starship init powershell)

# Alias for system info
Set-Alias -Name winfetch -Value pwshfetch-test-1
winfetch

# Efficient system uptime function
function Get-Uptime {
    $uptime = New-TimeSpan -Start (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
    return "{0} days, {1} hours, {2} minutes, {3} seconds" -f $uptime.Days, $uptime.Hours, $uptime.Minutes, $uptime.Seconds
}

# Anime playback function
function Watch-Anime {
    param ([string[]]$args)
    Write-Host "Anime time, let's go!"
    & sh ani-cli @args
}