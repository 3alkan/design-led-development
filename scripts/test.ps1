#Requires -Version 7.0
<#
.SYNOPSIS
  Local standard-library checks for TXT-001 and packaging.
#>
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'check-text-format.ps1')

function Assert([bool] $Condition, [string] $Message) {
    if (-not $Condition) { throw "FAILED: $Message" }
}

$good = [Text.Encoding]::UTF8.GetBytes("Héllo" + [char]10)
Assert (@(Get-TextViolations $good 'ok.md').Count -eq 0) 'valid UTF-8 LF'
Assert (@(Get-TextViolations ([byte[]](239,187,191,65,10)) 'bom.md') -contains 'UTF-8 BOM') 'BOM detection'
Assert (@(Get-TextViolations ([byte[]](65,13,10)) 'crlf.md') -contains 'CR detected (use LF)') 'CRLF detection'
Assert (@(Get-TextViolations ([byte[]](65,255,10)) 'invalid.md') -contains 'Invalid UTF-8') 'invalid UTF-8 detection'
Assert (@(Get-TextViolations ([byte[]](0,255,13)) 'image.dat').Count -eq 0) 'binary exemption'

$root = Split-Path $PSScriptRoot -Parent
Assert (Test-RepositoryText $root) 'current tracked text'
Write-Host 'TXT-001 self-tests passed.'
