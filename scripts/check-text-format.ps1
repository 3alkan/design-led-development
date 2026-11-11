# SPDX-License-Identifier: GPL-3.0-only
#Requires -Version 7.0
<#
.SYNOPSIS
  Validate TXT-001 (UTF-8 without BOM and LF) in maintained text.
#>
param([string] $RepositoryRoot = (Split-Path $PSScriptRoot -Parent))

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-SourceFiles([string] $Directory, [bool] $IsRoot = $true) {
    foreach ($item in Get-ChildItem -LiteralPath $Directory -Force) {
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { continue }
        if ($item.PSIsContainer) {
            if ($IsRoot -and $item.Name -in @('.git', 'build')) { continue }
            Get-SourceFiles $item.FullName $false
        } else {
            $item.FullName
        }
    }
}

function Get-TextViolations([byte[]] $Bytes, [string] $Name) {
    $binaryExtensions = @(
        '.7z', '.avi', '.bin', '.bmp', '.class', '.dll', '.doc', '.docx',
        '.eot', '.exe', '.gif', '.gz', '.ico', '.jar', '.jpeg', '.jpg',
        '.mp3', '.mp4', '.otf', '.pdf', '.png', '.ppt', '.pptx', '.so',
        '.tar', '.ttf', '.wasm', '.webp', '.woff', '.woff2', '.xls',
        '.xlsx', '.zip'
    )
    if ([IO.Path]::GetExtension($Name).ToLowerInvariant() -in $binaryExtensions -or
        $Bytes -contains [byte]0) { return @() }

    $problems = [Collections.Generic.List[string]]::new()
    if ($Bytes.Length -ge 3 -and $Bytes[0] -eq 239 -and
        $Bytes[1] -eq 187 -and $Bytes[2] -eq 191) {
        $problems.Add('UTF-8 BOM')
    }
    try {
        $null = [Text.UTF8Encoding]::new($false, $true).GetString($Bytes)
    } catch [Text.DecoderFallbackException] {
        $problems.Add('Invalid UTF-8')
    }
    if ($Bytes -contains [byte]13) { $problems.Add('CR detected (use LF)') }
    return @($problems.ToArray())
}

function Test-RepositoryText([string] $Root) {
    $rootPath = [IO.Path]::GetFullPath($Root)
    $checked = 0
    $failed = 0
    foreach ($path in @(Get-SourceFiles $rootPath)) {
        $relative = [IO.Path]::GetRelativePath($rootPath, $path).Replace([char]92, [char]47)
        $checked++
        $problems = @(Get-TextViolations ([IO.File]::ReadAllBytes($path)) $relative)
        if ($problems.Count -gt 0) {
            $failed++
            Write-Host "FAIL $relative : $($problems -join ', ')" -ForegroundColor Red
        }
    }
    Write-Host "TXT-001: $checked files checked; $failed failures."
    return ($failed -eq 0)
}

if ($MyInvocation.InvocationName -ne '.') {
    try {
        if (-not (Test-RepositoryText $RepositoryRoot)) { exit 1 }
    } catch {
        Write-Error $_
        exit 1
    }
}
