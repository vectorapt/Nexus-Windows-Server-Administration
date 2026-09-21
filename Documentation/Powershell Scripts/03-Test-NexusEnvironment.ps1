#requires -RunAsAdministrator

Import-Module ActiveDirectory

Clear-Host

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "                 NEXUS SERVER HEALTH CHECK                              " -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan

Write-Host "`n[ SYSTEM INFORMATION ]" -ForegroundColor Yellow

Get-CimInstance Win32_OperatingSystem |
    Select-Object CSName, Caption, Version, LastBootUpTime |
    Format-Table -AutoSize

Write-Host "`n[ MEMORY ]" -ForegroundColor Yellow

Get-CimInstance Win32_OperatingSystem |
    Select-Object @{Name="TotalMemoryGB";Expression={[math]::Round($_.TotalVisibleMemorySize / 1MB, 2)}},
                  @{Name="FreeMemoryGB";Expression={[math]::Round($_.FreePhysicalMemory / 1MB, 2)}} |
    Format-Table -AutoSize

Write-Host "`n[ DISK SPACE ]" -ForegroundColor Yellow

Get-PSDrive -PSProvider FileSystem |
    Select-Object Name,
                  @{Name="UsedGB";Expression={[math]::Round($_.Used / 1GB, 2)}},
                  @{Name="FreeGB";Expression={[math]::Round($_.Free / 1GB, 2)}} |
    Format-Table -AutoSize

Write-Host "`n[ NETWORK HEALTH ]" -ForegroundColor Yellow

Write-Host "`nNAT Gateway:"
Test-Connection 192.168.245.2 -Count 2 -Quiet

Write-Host "`nInternet Connectivity:"
Test-Connection 8.8.8.8 -Count 2 -Quiet

Write-Host "`nDNS Resolution:" -ForegroundColor White

$DNSResult = Resolve-DnsName google.com -ErrorAction SilentlyContinue |
    Select-Object Name, Type, IPAddress

$DNSResult | Format-Table -AutoSize

Write-Host "`n[ ESSENTIAL SERVICES ]" -ForegroundColor Yellow

$Services = @(
    "NTDS"
    "DNS"
    "DHCP"
)

foreach ($ServiceName in $Services) {
    $Service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

    if ($Service) {
        Write-Host "$($Service.DisplayName) : $($Service.Status)"
    }
    else {
        Write-Host "$ServiceName : Not found" -ForegroundColor Red
    }
}

Write-Host "`n========================================================================" -ForegroundColor Cyan
Write-Host "System health check completed." -ForegroundColor Green
Write-Host "========================================================================" -ForegroundColor Cyan