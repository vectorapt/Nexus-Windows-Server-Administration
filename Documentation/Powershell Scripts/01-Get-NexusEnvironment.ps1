#requires -RunAsAdministrator

<#
.SYNOPSIS
    Displays basic Project Nexus environment information.

.DESCRIPTION
    Collects system, domain, network, DNS, and infrastructure
    service information from the Nexus domain controller.

.NOTES
    Project: Project Nexus
    Script: Get-NexusEnvironment.ps1
#>

Clear-Host

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "              NEXUS ENVIRONMENT               " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# --------------------------------------------------
# System Information
# --------------------------------------------------

Write-Host "`n[ SYSTEM INFORMATION ]" -ForegroundColor Yellow

$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$OperatingSystem = Get-CimInstance Win32_OperatingSystem

Write-Host "Computer Name : $($ComputerSystem.Name)"
Write-Host "Operating System : $($OperatingSystem.Caption)"
Write-Host "OS Version : $($OperatingSystem.Version)"
Write-Host "Domain : $($ComputerSystem.Domain)"
Write-Host "System Type : $($ComputerSystem.SystemType)"

# --------------------------------------------------
# Network Configuration
# --------------------------------------------------

Write-Host "`n[ NETWORK CONFIGURATION ]" -ForegroundColor Yellow

Get-NetIPConfiguration |
    Select-Object InterfaceAlias,
                  @{Name="IPv4Address";Expression={
                      ($_.IPv4Address | Select-Object -ExpandProperty IPv4Address) -join ", "
                  }},
                  @{Name="IPv4Gateway";Expression={
                      ($_.IPv4DefaultGateway | Select-Object -ExpandProperty NextHop) -join ", "
                  }},
                  @{Name="DNSServers";Expression={
                      ($_.DNSServer.ServerAddresses) -join ", "
                  }} |
    Format-Table -AutoSize

# --------------------------------------------------
# Domain Controller Information
# --------------------------------------------------

Write-Host "`n[ DOMAIN CONTROLLER INFORMATION ]" -ForegroundColor Yellow

try {
    Get-ADDomainController |
        Select-Object Name,
                      HostName,
                      IPv4Address,
                      Site,
                      OperatingSystem |
        Format-Table -AutoSize
}
catch {
    Write-Host "Unable to retrieve domain controller information." -ForegroundColor Red
}

# --------------------------------------------------
# Completion
# --------------------------------------------------

Write-Host "`n==============================================" -ForegroundColor Cyan
Write-Host "Environment information collected successfully." -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Cyan