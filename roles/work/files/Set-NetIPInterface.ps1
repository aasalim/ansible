# Prompt user for elevated prompt if it is not already
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Configure the network for WSL2 on VPN
Write-Host "Running..."
Get-NetAdapter | Where-Object { $_.InterfaceDescription -Match "Cisco AnyConnect" } | Set-NetIPInterface -InterfaceMetric 6000
Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" | Set-NetIPInterface -InterfaceMetric 1 
wsl.exe -u root bash -c 'sudo drproxy on'
Write-Host "Done!"
Start-Sleep -Milliseconds 100 # Flush the output to the terminal

