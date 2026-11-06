#Requires -Version 7.0
<#
.SYNOPSIS
  Assemble and validate the DLD product using only PowerShell 7 and .NET.
#>
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Assert-ManagedPath([string] $Path, [bool] $IsDirectory) {
    if (Test-Path -LiteralPath $Path) {
        $item = Get-Item -LiteralPath $Path -Force
        if ($item.PSIsContainer -ne $IsDirectory -or
            ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
            throw "Unsafe managed output: $Path"
        }
    }
}
function Assert-Product([string] $Root, [string[]] $Expected) {
    $actual = @(Get-ChildItem -LiteralPath $Root -File -Recurse -Force |
        ForEach-Object { [IO.Path]::GetRelativePath($Root, $_.FullName).Replace('\','/') } |
        Sort-Object -CaseSensitive)
    $wanted = @($Expected | Sort-Object -CaseSensitive)
    if ($actual.Count -ne $wanted.Count -or
        [string]::Join([char]10,$actual) -cne [string]::Join([char]10,$wanted)) {
        throw "Unexpected assembled product files: $($actual -join ', ')"
    }
    if (@(Get-ChildItem -LiteralPath $Root -Recurse -Force |
        Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }).Count) {
        throw 'Assembled product contains a symlink or reparse point.'
    }
    $rootPrefix = [IO.Path]::GetFullPath($Root).TrimEnd([IO.Path]::DirectorySeparatorChar) +
        [IO.Path]::DirectorySeparatorChar
    foreach ($relative in $Expected | Where-Object { $_.EndsWith('.md') }) {
        $file = Join-Path $Root $relative
        foreach ($match in [regex]::Matches([IO.File]::ReadAllText($file),
                '!?\[[^\]]*\]\((?<target>[^)]+)\)')) {
            $target = $match.Groups['target'].Value.Trim()
            if (-not $target -or $target.StartsWith('#') -or
                $target -match '^[a-zA-Z][a-zA-Z0-9+.-]*:' -or $target.StartsWith('//')) { continue }
            $part = ($target -split '[#?]',2)[0]
            if (-not $part) { continue }
            $part = [uri]::UnescapeDataString($part)
            if ([IO.Path]::IsPathRooted($part)) { throw "Absolute local link: $relative -> $target" }
            $resolved = [IO.Path]::GetFullPath((Join-Path (Split-Path $file -Parent) $part))
            if (-not $resolved.StartsWith($rootPrefix,[StringComparison]::Ordinal) -or
                (-not [IO.File]::Exists($resolved) -and -not [IO.Directory]::Exists($resolved))) {
                throw "Broken or escaping local link: $relative -> $target"
            }
        }
    }
}

$repo = [IO.Path]::GetFullPath((Split-Path $PSScriptRoot -Parent))
$build = Join-Path $repo 'build'
$stage = $null
$keepStage = $false
try {
    # Explicit source-to-product mapping; no automatic directory inclusion.
    $files = [ordered]@{
        'docs/product-readme.md' = 'README.md'
        'starter/README.md' = 'starter/README.md'
        'foundation/CORE.md' = 'starter/foundation/CORE.md'
        'starter/foundation/DESIGN.md' = 'starter/foundation/DESIGN.md'
        'starter/foundation/RULES.md' = 'starter/foundation/RULES.md'
        'docs/supporting/repository-layout.md' = 'supporting/repository-layout.md'
        'VERSION' = 'VERSION'
        'CHANGELOG.md' = 'CHANGELOG.md'
        'LICENSE' = 'LICENSE'
        'LICENSE-CC0' = 'LICENSE-CC0'
    }
    $names = @($files.Values)
    if (@($names | Select-Object -Unique).Count -ne $names.Count) { throw 'Duplicate destination.' }
    foreach ($source in $files.Keys) {
        $path = Join-Path $repo $source
        if (-not [IO.File]::Exists($path)) { throw "Missing source: $source" }
        if ((Get-Item -LiteralPath $path -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
            throw "Linked source is not allowed: $source"
        }
    }
    $version = [IO.File]::ReadAllText((Join-Path $repo 'VERSION')).Trim()
    if ($version -cnotmatch '^\d+\.\d+\.\d+$') { throw "Invalid VERSION: $version" }
    $core = [IO.File]::ReadAllText((Join-Path $repo 'foundation/CORE.md'))
    $releaseMatch = [regex]::Match($core,
        '(?m)^\*\*DLD Version:\s*(?<v>\d+\.\d+\.\d+)\*\*\s*$')
    $methodMatch = [regex]::Match($core,
        '(?m)^\*\*Methodology Version:\s*(?<v>\d+\.\d+\.\d+)\*\*\s*$')
    if (-not $releaseMatch.Success -or -not $methodMatch.Success) {
        throw 'Core DLD Version or Methodology Version not found.'
    }
    $coreVersion = $releaseMatch.Groups['v'].Value
    $methodVersion = $methodMatch.Groups['v'].Value
    if ($version -cne $coreVersion) {
        throw "Version mismatch: VERSION=$version; Core DLD Version=$coreVersion. Sources unchanged."
    }
    if ([version]$methodVersion -gt [version]$coreVersion) {
        throw "Methodology Version $methodVersion cannot exceed DLD Version $coreVersion."
    }

    Assert-ManagedPath $build $true
    [IO.Directory]::CreateDirectory($build) | Out-Null
    $stage = Join-Path $build ('.package-stage-' + [guid]::NewGuid().ToString('N'))
    $product = Join-Path $stage 'product'
    [IO.Directory]::CreateDirectory($product) | Out-Null
    foreach ($source in $files.Keys) {
        $dest = Join-Path $product $files[$source]
        [IO.Directory]::CreateDirectory((Split-Path $dest -Parent)) | Out-Null
        [IO.File]::Copy((Join-Path $repo $source),$dest,$true)
    }
    $template = Join-Path $product 'starter/README.md'
    $templateText = [IO.File]::ReadAllText($template)
    if (-not $templateText.Contains('@DLD_BASELINE@') -or
        -not $templateText.Contains('@DLD_METHODOLOGY@')) {
        throw 'Missing DLD Version or Methodology Version placeholder.'
    }
    $rendered = $templateText.Replace('@DLD_BASELINE@',$version).
        Replace('@DLD_METHODOLOGY@',$methodVersion)
    [IO.File]::WriteAllText($template,$rendered,[Text.UTF8Encoding]::new($false))
    Assert-Product $product $names
    $a = (Get-FileHash -LiteralPath (Join-Path $repo 'foundation/CORE.md') -Algorithm SHA256).Hash
    $b = (Get-FileHash -LiteralPath (Join-Path $product 'starter/foundation/CORE.md') -Algorithm SHA256).Hash
    if ($a -cne $b) { throw 'Core is not byte-identical.' }
    foreach ($name in $names) {
        $content = [IO.File]::ReadAllText((Join-Path $product $name))
        if ($content.Contains('@DLD_BASELINE@') -or $content.Contains('@DLD_METHODOLOGY@')) {
            throw "Unresolved placeholder: $name"
        }
    }

    $prefix = "dld-v$version"
    $zipName = "$prefix.zip"
    $sumName = "$zipName.sha256"
    $zipPath = Join-Path $stage $zipName
    $fileStream = [IO.File]::Open($zipPath,[IO.FileMode]::CreateNew)
    try {
        $zip = [IO.Compression.ZipArchive]::new($fileStream,
            [IO.Compression.ZipArchiveMode]::Create,$true,[Text.Encoding]::UTF8)
        try {
            foreach ($name in @($names | Sort-Object -CaseSensitive)) {
                $entry = $zip.CreateEntry("$prefix/$($name.Replace('\','/'))",
                    [IO.Compression.CompressionLevel]::NoCompression)
                $entry.LastWriteTime = [DateTimeOffset]::new(1980,1,1,0,0,0,[TimeSpan]::Zero)
                $entry.ExternalAttributes = 0
                $output = $entry.Open()
                try {
                    $input = [IO.File]::OpenRead((Join-Path $product $name))
                    try { $input.CopyTo($output) } finally { $input.Dispose() }
                } finally { $output.Dispose() }
            }
        } finally { $zip.Dispose() }
    } finally { $fileStream.Dispose() }

    $zip = [IO.Compression.ZipFile]::OpenRead($zipPath)
    try {
        $expected = @($names | ForEach-Object { "$prefix/$($_.Replace('\','/'))" } |
            Sort-Object -CaseSensitive)
        $actual = @($zip.Entries | ForEach-Object { $_.FullName } | Sort-Object -CaseSensitive)
        if ($actual.Count -ne $expected.Count -or
            [string]::Join([char]10,$actual) -cne [string]::Join([char]10,$expected)) {
            throw 'ZIP entry list does not match product manifest.'
        }
        foreach ($entry in $zip.Entries) {
            $relative = $entry.FullName.Substring($prefix.Length+1)
            $stream = $entry.Open()
            try {
                $sha = [Security.Cryptography.SHA256]::Create()
                try { $entryHash = [Convert]::ToHexString($sha.ComputeHash($stream)) }
                finally { $sha.Dispose() }
            } finally { $stream.Dispose() }
            $fileHash = (Get-FileHash -LiteralPath (Join-Path $product $relative) -Algorithm SHA256).Hash
            if ($entryHash -cne $fileHash) { throw "Invalid ZIP entry: $relative" }
        }
    } finally { $zip.Dispose() }

    $digest = (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash.ToLowerInvariant()
    [IO.File]::WriteAllText((Join-Path $stage $sumName),
        ($digest + '  ' + $zipName + [char]10),[Text.UTF8Encoding]::new($false))
    if ((Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash.ToLowerInvariant() -cne $digest) {
        throw 'Checksum verification failed.'
    }

    $managed = @('product',$zipName,$sumName)
    $obsolete = @(Get-ChildItem -LiteralPath $build -File -Force | Where-Object {
        $_.Name -cmatch '^dld-v\d+\.\d+\.\d+\.zip(\.sha256)?$' -and
        $_.Name -cnotin @($zipName,$sumName)
    } | ForEach-Object { $_.Name })
    foreach ($name in @($managed + $obsolete)) {
        Assert-ManagedPath (Join-Path $build $name) ($name -eq 'product')
    }
    $backup = Join-Path $stage '.previous'
    [IO.Directory]::CreateDirectory($backup) | Out-Null
    $prior = [Collections.Generic.List[string]]::new()
    $new = [Collections.Generic.List[string]]::new()
    try {
        foreach ($name in @($managed + $obsolete)) {
            $path = Join-Path $build $name
            if (Test-Path -LiteralPath $path) {
                Move-Item -LiteralPath $path -Destination (Join-Path $backup $name)
                $prior.Add($name)
            }
        }
        foreach ($name in $managed) {
            Move-Item -LiteralPath (Join-Path $stage $name) -Destination (Join-Path $build $name)
            $new.Add($name)
        }
    } catch {
        $reason = $_
        foreach ($name in $new) {
            Remove-Item -LiteralPath (Join-Path $build $name) -Recurse -Force -ErrorAction Continue
        }
        foreach ($name in $prior) {
            $saved = Join-Path $backup $name
            if (Test-Path -LiteralPath $saved) {
                Move-Item -LiteralPath $saved -Destination (Join-Path $build $name) -ErrorAction Continue
            }
        }
        if (@(Get-ChildItem -LiteralPath $backup -Force).Count -gt 0) { $keepStage = $true }
        throw "Replacement failed; rollback attempted: $reason"
    }
    Write-Host "Validated DLD product $version"
    Write-Host "ZIP: $(Join-Path $build $zipName)"
    Write-Host "SHA-256: $digest"
} catch {
    Write-Error ("DLD packaging failed: " + $_.Exception.Message) -ErrorAction Continue
    exit 1
} finally {
    if ($stage -and -not $keepStage -and (Test-Path -LiteralPath $stage)) {
        Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue
    }
}
