# SPDX-License-Identifier: GPL-3.0-only
#Requires -Version 7.0
<#
.SYNOPSIS
  Test TXT-001 and product assembly locally.
#>
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'check-text-format.ps1')
. (Join-Path $PSScriptRoot 'package.ps1')

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

# Verify the repository-wide GPL default and the explicit CC0 exceptions.
$cc0Paths = @('product-files/CONTEXT-REGISTRY.md')
$withoutHeader = @('LICENSE', 'LICENSE-CC0', 'VERSION')
foreach ($path in @(Get-SourceFiles $root)) {
    $relative = [IO.Path]::GetRelativePath($root, $path).Replace([char]92, [char]47)
    if ($relative -in $withoutHeader) { continue }
    $license = if ($relative -in $cc0Paths) { 'CC0-1.0' } else { 'GPL-3.0-only' }
    $firstLine = [IO.File]::ReadLines($path) | Select-Object -First 1
    $expected = if ($relative.EndsWith('.md')) {
        "<!-- SPDX-License-Identifier: $license -->"
    } else {
        "# SPDX-License-Identifier: $license"
    }
    Assert ($firstLine -ceq $expected) "license notice: $relative (expected $license)"
}


# Assemble a temporary three-file product without modifying the repository's build outputs.
$fixture = Join-Path ([IO.Path]::GetTempPath()) ('dld-package-test-' + [guid]::NewGuid().ToString('N'))
try {
    [IO.Directory]::CreateDirectory((Join-Path $fixture 'product-files')) | Out-Null
    [IO.Directory]::CreateDirectory((Join-Path $fixture 'dld')) | Out-Null
    $utf8 = [Text.UTF8Encoding]::new($false)
    [IO.File]::WriteAllText((Join-Path $fixture 'product-files/README.md'),
        "# Example" + [char]10 + "[Method](dld/DLD.md)" + [char]10, $utf8)
    [IO.File]::WriteAllText((Join-Path $fixture 'dld/DLD.md'), "# Method" + [char]10, $utf8)
    $fixtureVersion = [IO.File]::ReadAllText((Join-Path $root 'VERSION')).Trim()
    [IO.File]::WriteAllText((Join-Path $fixture 'VERSION'), $fixtureVersion + [char]10, $utf8)
    $manifest = @'
[product]
name = "DLD"
version_file = "VERSION"

[[files]]
source = "product-files/README.md"
destination = "README.md"

[[files]]
source = "dld/DLD.md"
destination = "dld/DLD.md"

[[files]]
source = "VERSION"
destination = "VERSION"
'@
    [IO.File]::WriteAllText((Join-Path $fixture 'product.toml'), $manifest + [char]10, $utf8)

    Invoke-DldPackage $fixture
    $archive = Join-Path $fixture ("build/dld-v$fixtureVersion.zip")
    $checksum = "$archive.sha256"
    Assert ([IO.File]::Exists($archive) -and [IO.File]::Exists($checksum)) 'package and checksum generated'
    $originalHash = (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash
    Invoke-DldPackage $fixture
    Assert ((Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash -ceq $originalHash) 'reproducible archive'

    [IO.File]::WriteAllText((Join-Path $fixture 'product-files/README.md'),
        "[Missing](not-found.md)" + [char]10, $utf8)
    $rejected = $false
    try { Invoke-DldPackage $fixture } catch { $rejected = $true }
    Assert $rejected 'broken product link rejected'
    Assert ((Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash -ceq $originalHash) 'previous output preserved'
} finally {
    if ([IO.Directory]::Exists($fixture)) { [IO.Directory]::Delete($fixture, $true) }
}

Write-Host 'Local validation tests passed.'
