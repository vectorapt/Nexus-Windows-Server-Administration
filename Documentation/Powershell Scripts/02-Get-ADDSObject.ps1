#requires -RunAsAdministrator

Import-Module ActiveDirectory

Clear-Host

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "                    PROJECT NEXUS AD INVENTORY                         " -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan

# -------------------------------------------------------------------------
# Domain
# -------------------------------------------------------------------------

Write-Host "`n[ DOMAIN ]" -ForegroundColor Yellow

Get-ADDomain |
    Select-Object DNSRoot, NetBIOSName, Forest, PDCEmulator |
    Format-Table -AutoSize

# -------------------------------------------------------------------------
# Organizational Units
# -------------------------------------------------------------------------

Write-Host "`n[ ORGANIZATIONAL UNITS ]" -ForegroundColor Yellow

Get-ADOrganizationalUnit -Filter * |
    Select-Object Name, DistinguishedName |
    Format-Table -AutoSize

# -------------------------------------------------------------------------
# Users
# -------------------------------------------------------------------------

Write-Host "`n[ USERS ]" -ForegroundColor Yellow

Get-ADUser -Filter * |
    Select-Object Name,
                  SamAccountName,
                  Enabled,
                  @{Name="OU";Expression={
                      $_.DistinguishedName -replace '^CN=[^,]+,',''
                  }} |
    Format-Table -AutoSize

# -------------------------------------------------------------------------
# Groups
# -------------------------------------------------------------------------

Write-Host "`n[ GROUPS ]" -ForegroundColor Yellow

Get-ADGroup -Filter * |
    Select-Object Name, GroupScope, GroupCategory |
    Format-Table -AutoSize

# -------------------------------------------------------------------------
# Computers
# -------------------------------------------------------------------------

Write-Host "`n[ COMPUTERS ]" -ForegroundColor Yellow

Get-ADComputer -Filter * |
    Select-Object Name, DistinguishedName |
    Format-Table -AutoSize

# -------------------------------------------------------------------------
# Completion
# -------------------------------------------------------------------------

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "AD inventory completed." -ForegroundColor Green
Write-Host "========================================================================" -ForegroundColor Cyan