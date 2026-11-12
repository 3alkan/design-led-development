# SPDX-License-Identifier: MIT
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
Assert ([IO.File]::ReadAllText((Join-Path $root 'LICENSE')).StartsWith("MIT License" + [char]10)) 'MIT license text'
Assert (-not [IO.File]::Exists((Join-Path $root 'LICENSE-CC0'))) 'obsolete CC0 license removed'
Assert (-not ([IO.File]::ReadAllText((Join-Path $root 'product.toml')).Contains('LICENSE-CC0'))) 'manifest excludes obsolete license'
Assert (Test-RepositoryText $root) 'current tracked text'

# Check that original source files consistently declare MIT.
$withoutHeader = @('LICENSE', 'VERSION')
foreach ($path in @(Get-SourceFiles $root)) {
    $relative = [IO.Path]::GetRelativePath($root, $path).Replace([char]92, [char]47)
    if ($relative -in $withoutHeader) { continue }
    $firstLine = [IO.File]::ReadLines($path) | Select-Object -First 1
    if ($relative.EndsWith('.md')) {
        Assert ($firstLine -cmatch '^<!-- SPDX-License-Identifier: MIT -->$') "MIT SPDX license notice: $relative"
    } else {
        Assert ($firstLine -cmatch '^# SPDX-License-Identifier: MIT$') "MIT SPDX license notice: $relative"
    }
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

    # Expand recursive directories and filename wildcards with preserved relative paths.
    $extras = Join-Path $fixture 'extras'
    [IO.Directory]::CreateDirectory((Join-Path $extras 'nested')) | Out-Null
    [IO.File]::WriteAllText((Join-Path $extras 'top.md'), "Top" + [char]10, $utf8)
    [IO.File]::WriteAllText((Join-Path $extras 'other.txt'), "Other" + [char]10, $utf8)
    [IO.File]::WriteAllText((Join-Path $extras 'nested/child.md'), "Child" + [char]10, $utf8)
    $baseManifest = [IO.File]::ReadAllText((Join-Path $fixture 'product.toml'))
    $dirMap = @'

[[files]]
source = "extras/"
destination = "examples/"
'@
    [IO.File]::WriteAllText((Join-Path $fixture 'product.toml'), $baseManifest + $dirMap, $utf8)
    Invoke-DldPackage $fixture
    Assert ([IO.File]::Exists((Join-Path $fixture 'build/product/examples/nested/child.md'))) 'recursive directory expansion'
    $directoryHash = (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash
    Invoke-DldPackage $fixture
    Assert ((Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash -ceq $directoryHash) 'recursive archive reproducible'

    $wildcardMap = @'

[[files]]
source = "extras/*.md"
destination = "selected/"
'@
    [IO.File]::WriteAllText((Join-Path $fixture 'product.toml'), $baseManifest + $wildcardMap, $utf8)
    Invoke-DldPackage $fixture
    Assert ([IO.File]::Exists((Join-Path $fixture 'build/product/selected/top.md'))) 'wildcard file selected'
    Assert (-not [IO.File]::Exists((Join-Path $fixture 'build/product/selected/nested/child.md'))) 'wildcard nonrecursive'
    Assert (-not [IO.File]::Exists((Join-Path $fixture 'build/product/selected/other.txt'))) 'wildcard filters extension'

    $validHash = (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash
    foreach ($invalid in @(
        $baseManifest + $dirMap + $dirMap,
        $baseManifest + $dirMap + @'

[[files]]
source = "extras/top.md"
destination = "examples/top.md"
'@,
        $baseManifest + @'

[[files]]
source = "extras/*.pdf"
destination = "selected/"
'@,
        $baseManifest + @'

[[files]]
source = "extras/**"
destination = "selected/"
'@
    )) {
        [IO.File]::WriteAllText((Join-Path $fixture 'product.toml'), $invalid, $utf8)
        $rejected = $false
        try { Invoke-DldPackage $fixture } catch { $rejected = $true }
        Assert $rejected 'invalid or overlapping expansion rejected'
        Assert ((Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash -ceq $validHash) 'invalid expansion preserves output'
    }
    [IO.File]::WriteAllText((Join-Path $fixture 'product.toml'), $baseManifest, $utf8)
    Invoke-DldPackage $fixture

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
