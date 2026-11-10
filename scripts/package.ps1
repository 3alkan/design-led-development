# SPDX-License-Identifier: GPL-3.0-only
#Requires -Version 7.0
<#
.SYNOPSIS
  Assemble and verify the DLD product with PowerShell 7 and built-in .NET only.
.DESCRIPTION
  The explicit product.toml mappings control all source and destination files.
  Output: build/product, build/dld-v<VERSION>.zip and .zip.sha256.
#>
param([string] $RepositoryRoot = (Split-Path $PSScriptRoot -Parent))

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Assert-SafeRelativePath([string] $Value) {
    if ([string]::IsNullOrWhiteSpace($Value) -or $Value.Contains('\') -or
        $Value.Contains(':') -or $Value.StartsWith('/') -or
        ($Value -split '/') -contains '..' -or
        ($Value -split '/') -contains '.' -or
        ($Value -split '/') -contains '') {
        throw "Unsafe relative path: $Value"
    }
    if ($Value -cnotmatch '^[a-zA-Z0-9_./-]+$') { throw "Unsafe relative path: $Value" }
}

function Assert-SafeMappingPath([string] $Value, [bool] $Grouped) {
    $path = if ($Grouped) { $Value.TrimEnd('/') } else { $Value }
    Assert-SafeRelativePath $path
}

function Assert-SourceNotLinked([string] $Root, [string] $Path) {
    $base = [IO.Path]::GetFullPath($Root).TrimEnd([IO.Path]::DirectorySeparatorChar)
    $candidate = [IO.Path]::GetFullPath($Path)
    if (-not $candidate.StartsWith($base + [IO.Path]::DirectorySeparatorChar,
        [StringComparison]::OrdinalIgnoreCase)) {
        throw "Source escapes repository: $Path"
    }
    $cursor = $candidate
    while ($cursor -ne $base) {
        $item = Get-Item -LiteralPath $cursor -Force -ErrorAction Stop
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            throw "Linked source path: $cursor"
        }
        $cursor = Split-Path $cursor -Parent
    }
}

function Expand-ProductMapping([string] $Root, [string] $Source, [string] $Destination) {
    # Exact file: file-to-file. Directory ending /: recursively copy contents.
    # A final filename segment with *: match immediate files, not subdirectories.
    $directoryMode = $Source.EndsWith('/')
    $wildcardMode = $Source.Contains('*')
    if ($directoryMode -and $wildcardMode) { throw "Ambiguous source pattern: $Source" }
    if (-not $directoryMode -and -not $wildcardMode) {
        Assert-SafeRelativePath $Source
        Assert-SafeRelativePath $Destination
        $sourceFile = Join-Path $Root $Source
        if (-not [IO.File]::Exists($sourceFile)) { throw "Missing source: $Source" }
        Assert-SourceNotLinked $Root $sourceFile
        return ,([pscustomobject]@{ source=$Source; destination=$Destination })
    }

    if (-not $Destination.EndsWith('/')) {
        throw "Directory or wildcard mapping requires destination ending in /: $Destination"
    }
    Assert-SafeMappingPath $Destination $true
    $origin = ''
    $files = @()
    if ($directoryMode) {
        Assert-SafeMappingPath $Source $true
        $origin = $Source.TrimEnd('/')
        $directory = Join-Path $Root $origin
        if (-not [IO.Directory]::Exists($directory)) { throw "Missing source directory: $Source" }
        Assert-SourceNotLinked $Root $directory
        # Inspect every directory before descending; never follow reparse points.
        $pending = [Collections.Generic.Stack[string]]::new()
        $pending.Push($directory)
        $found = [Collections.Generic.List[object]]::new()
        while ($pending.Count -gt 0) {
            $currentDirectory = $pending.Pop()
            foreach ($child in @(Get-ChildItem -LiteralPath $currentDirectory -Force)) {
                if ($child.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                    throw "Linked source in directory mapping: $($child.FullName)"
                }
                if ($child.PSIsContainer) { $pending.Push($child.FullName) }
                else { $found.Add($child) }
            }
        }
        $files = @($found.ToArray())
    } else {
        # A single * is permitted only in the final filename segment.
        $wildcardExpression = '^(?<dir>(?:[A-Za-z0-9_.-]+/)*)(?<name>[A-Za-z0-9_.-]*\*[A-Za-z0-9_.-]*)\z'
        $sourceMatch = [Regex]::Match($Source, $wildcardExpression)
        if (-not $sourceMatch.Success) {
            throw "Unsupported source wildcard: $Source"
        }
        $origin = $sourceMatch.Groups['dir'].Value.TrimEnd('/')
        $filenamePattern = $sourceMatch.Groups['name'].Value
        if (-not $origin) { throw "Wildcard source requires a parent directory: $Source" }
        Assert-SafeRelativePath $origin
        $directory = Join-Path $Root $origin
        if (-not [IO.Directory]::Exists($directory)) { throw "Missing source directory: $origin" }
        Assert-SourceNotLinked $Root $directory
        $matcher = [Regex]::new('^' + [Regex]::Escape($filenamePattern).Replace('\*','[^/]*') + '$',
            [Text.RegularExpressions.RegexOptions]::CultureInvariant)
        $files = @(Get-ChildItem -LiteralPath $directory -File -Force |
            Where-Object { $matcher.IsMatch($_.Name) })
    }

    if ($files.Count -eq 0) { throw "Source pattern matches no files: $Source" }
    $result = [Collections.Generic.List[object]]::new()
    foreach ($file in $files) {
        Assert-SourceNotLinked $Root $file.FullName
        $relative = [IO.Path]::GetRelativePath((Join-Path $Root $origin), $file.FullName).Replace('\','/')
        Assert-SafeRelativePath $relative
        $resolvedSource = "$origin/$relative"
        $resolvedDestination = "$Destination$relative"
        Assert-SafeRelativePath $resolvedDestination
        $result.Add([pscustomobject]@{ source=$resolvedSource; destination=$resolvedDestination })
    }
    return @($result | Sort-Object destination -CaseSensitive)
}

function Read-ProductManifest([string] $Root) {
    $manifest = Join-Path $Root 'product.toml'
    $versionFile = $false
    $section = ''
    $records = [Collections.Generic.List[object]]::new()
    $current = $null
    foreach ($raw in [IO.File]::ReadAllLines($manifest, [Text.Encoding]::UTF8)) {
        $line = $raw.Trim()
        if (-not $line -or $line.StartsWith('#')) { continue }
        if ($line -eq '[product]') { $section = 'product'; continue }
        if ($line -eq '[[files]]') {
            $section = 'file'
            $current = @{}
            $records.Add($current)
            continue
        }
        if ($line -cmatch '^(?<key>[a-z_]+)\s*=\s*"(?<value>[^"]*)"$') {
            $key = $Matches['key']
            $value = $Matches['value']
        } else {
            throw "Unsupported manifest line: $line"
        }
        if ($section -eq 'product') {
            if ($key -eq 'version_file') {
                if ($versionFile -or $value -cne 'VERSION') { throw 'Invalid version_file' }
                $versionFile = $true
            } elseif ($key -ne 'name' -or $value -cne 'DLD') {
                throw "Unexpected product field: $key"
            }
        } elseif ($section -eq 'file') {
            if ($key -cnotin @('source', 'destination') -or $current.ContainsKey($key)) {
                throw "Unexpected or duplicate mapping field: $key"
            }
            if (-not $value) { throw "Empty mapping field: $key" }
            $current[$key] = $value
        } else { throw 'Manifest field outside a section' }
    }
    if (-not $versionFile -or $records.Count -eq 0) { throw 'Incomplete manifest' }

    $expanded = [Collections.Generic.List[object]]::new()
    $destinations = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($item in $records) {
        if ($item.Count -ne 2 -or -not $item.ContainsKey('source') -or
            -not $item.ContainsKey('destination')) { throw 'Incomplete file mapping' }
        foreach ($file in @(Expand-ProductMapping $Root $item.source $item.destination)) {
            if (-not $destinations.Add($file.destination)) {
                throw "Duplicate destination: $($file.destination)"
            }
            $expanded.Add($file)
        }
    }
    if (-not $destinations.Contains('README.md') -or -not $destinations.Contains('VERSION')) {
        throw 'Manifest must include README.md and VERSION'
    }
    # A file must never be an ancestor of another file's destination.
    foreach ($file in $expanded) {
        $parents = $file.destination.Split('/')
        $relative = ''
        for ($i = 0; $i -lt $parents.Length - 1; $i++) {
            $relative = if ($relative) { "$relative/$($parents[$i])" } else { $parents[$i] }
            if ($destinations.Contains($relative)) {
                throw "File/directory destination collision: $relative"
            }
        }
    }
    return @($expanded.ToArray() | Sort-Object destination -CaseSensitive)
}

function Assert-Product([string] $Product, [object[]] $Files, [string] $Version) {
    $expected = @($Files | ForEach-Object { $_.destination } | Sort-Object -CaseSensitive)
    $actual = @(Get-ChildItem -LiteralPath $Product -File -Recurse -Force |
        ForEach-Object { [IO.Path]::GetRelativePath($Product, $_.FullName).Replace('\','/') } |
        Sort-Object -CaseSensitive)
    if ([string]::Join([char]10, $expected) -cne [string]::Join([char]10, $actual)) {
        throw 'Product contents differ from manifest'
    }
    if ([IO.File]::ReadAllText((Join-Path $Product 'VERSION')).Trim() -cne $Version) {
        throw 'Product version mismatch'
    }
    $prefix = [IO.Path]::GetFullPath($Product).TrimEnd([IO.Path]::DirectorySeparatorChar) +
        [IO.Path]::DirectorySeparatorChar
    foreach ($file in Get-ChildItem -LiteralPath $Product -File -Recurse -Filter '*.md') {
        $text = [IO.File]::ReadAllText($file.FullName, [Text.UTF8Encoding]::new($false, $true))
        foreach ($match in [regex]::Matches($text, '!?\[[^\]]*\]\((?<target>[^)]+)\)')) {
            $link = $match.Groups['target'].Value.Trim()
            if (-not $link -or $link.StartsWith('#') -or $link.StartsWith('//') -or
                $link -match '^[a-zA-Z][a-zA-Z0-9+.-]*:') { continue }
            $local = ($link -split '[#?]',2)[0]
            if (-not $local) { continue }
            $local = [uri]::UnescapeDataString($local)
            if ([IO.Path]::IsPathRooted($local)) { throw "Absolute product link: $link" }
            $resolved = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $local))
            if (-not $resolved.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase) -or
                (-not [IO.File]::Exists($resolved) -and -not [IO.Directory]::Exists($resolved))) {
                throw "Broken or escaping product link: $($file.Name) -> $link"
            }
        }
    }
}

function Invoke-DldPackage([string] $Root) {
    $Root = [IO.Path]::GetFullPath($Root)
    $files = @(Read-ProductManifest $Root)
    $version = [IO.File]::ReadAllText((Join-Path $Root 'VERSION')).Trim()
    if ($version -cnotmatch '^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$') {
        throw "Invalid SemVer VERSION: $version"
    }
    $name = "dld-v$version.zip"
    $sumName = "$name.sha256"
    $build = Join-Path $Root 'build'
    if (Test-Path -LiteralPath $build) {
        $existing = Get-Item -LiteralPath $build -Force
        if (-not $existing.PSIsContainer -or
            $existing.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            throw "Unsafe build directory: $build"
        }
    }
    [IO.Directory]::CreateDirectory($build) | Out-Null
    $stage = Join-Path $build ('.stage-' + [guid]::NewGuid().ToString('N'))
    $keepStage = $false
    try {
        $product = Join-Path $stage 'product'
        [IO.Directory]::CreateDirectory($product) | Out-Null
        foreach ($file in $files) {
            $source = Join-Path $Root $file.source
            $destination = Join-Path $product $file.destination
            [IO.Directory]::CreateDirectory((Split-Path $destination -Parent)) | Out-Null
            [IO.File]::Copy($source, $destination)
        }
        Assert-Product $product $files $version

        $archive = Join-Path $stage $name
        $stream = [IO.File]::Open($archive, [IO.FileMode]::CreateNew)
        try {
            $zip = [IO.Compression.ZipArchive]::new($stream,
                [IO.Compression.ZipArchiveMode]::Create, $true, [Text.Encoding]::UTF8)
            try {
                foreach ($file in @($files | Sort-Object { $_.destination } -CaseSensitive)) {
                    $entry = $zip.CreateEntry("dld-v$version/$($file.destination)",
                        [IO.Compression.CompressionLevel]::NoCompression)
                    $entry.LastWriteTime = [DateTimeOffset]::new(1980,1,1,0,0,0,[TimeSpan]::Zero)
                    $entry.ExternalAttributes = 0
                    $output = $entry.Open()
                    try {
                        $input = [IO.File]::OpenRead((Join-Path $product $file.destination))
                        try { $input.CopyTo($output) } finally { $input.Dispose() }
                    } finally { $output.Dispose() }
                }
            } finally { $zip.Dispose() }
        } finally { $stream.Dispose() }

        $zip = [IO.Compression.ZipFile]::OpenRead($archive)
        try {
            $wanted = @($files | ForEach-Object { "dld-v$version/$($_.destination)" } | Sort-Object -CaseSensitive)
            $found = @($zip.Entries | ForEach-Object { $_.FullName } | Sort-Object -CaseSensitive)
            if ([string]::Join([char]10,$wanted) -cne [string]::Join([char]10,$found)) {
                throw 'Archive contents differ from manifest'
            }
            foreach ($entry in $zip.Entries) {
                $relative = $entry.FullName.Substring(("dld-v$version/").Length)
                $entryStream = $entry.Open()
                try {
                    $entryHash = (Get-FileHash -InputStream $entryStream -Algorithm SHA256).Hash
                } finally { $entryStream.Dispose() }
                $fileHash = (Get-FileHash -LiteralPath (Join-Path $product $relative) -Algorithm SHA256).Hash
                if ($entryHash -cne $fileHash) {
                    throw "Archive payload mismatch: $relative"
                }
            }
        } finally { $zip.Dispose() }

        $digest = (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash.ToLowerInvariant()
        [IO.File]::WriteAllText((Join-Path $stage $sumName),
            "$digest  $name" + [char]10, [Text.UTF8Encoding]::new($false))

        $outputs = @('product', $name, $sumName)
        foreach ($outputName in $outputs) {
            $existingPath = Join-Path $build $outputName
            if (Test-Path -LiteralPath $existingPath) {
                $item = Get-Item -LiteralPath $existingPath -Force
                if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -or
                    ($item.PSIsContainer -ne ($outputName -eq 'product'))) {
                    throw "Unsafe managed output: $existingPath"
                }
            }
        }
        $backup = Join-Path $stage '.previous'
        [IO.Directory]::CreateDirectory($backup) | Out-Null
        $old = [Collections.Generic.List[string]]::new()
        $new = [Collections.Generic.List[string]]::new()
        try {
            foreach ($outputName in $outputs) {
                $existingPath = Join-Path $build $outputName
                if (Test-Path -LiteralPath $existingPath) {
                    Move-Item -LiteralPath $existingPath -Destination (Join-Path $backup $outputName)
                    $old.Add($outputName)
                }
            }
            foreach ($outputName in $outputs) {
                Move-Item -LiteralPath (Join-Path $stage $outputName) -Destination (Join-Path $build $outputName)
                $new.Add($outputName)
            }
        } catch {
            $keepStage = $true
            foreach ($outputName in $new) {
                Remove-Item -LiteralPath (Join-Path $build $outputName) -Recurse -Force -ErrorAction Continue
            }
            foreach ($outputName in $old) {
                $saved = Join-Path $backup $outputName
                if (Test-Path -LiteralPath $saved) {
                    Move-Item -LiteralPath $saved -Destination (Join-Path $build $outputName) -ErrorAction Continue
                }
            }
            throw "Publishing staged outputs failed; rollback attempted: $_"
        }

        Write-Host "Validated DLD $version"
        Write-Host "Product: $(Join-Path $build 'product')"
        Write-Host "Archive: $(Join-Path $build $name)"
        Write-Host "SHA-256: $digest"
    } finally {
        if (-not $keepStage -and (Test-Path -LiteralPath $stage)) {
            Remove-Item -LiteralPath $stage -Recurse -Force
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    try { Invoke-DldPackage $RepositoryRoot } catch {
        Write-Error "DLD packaging failed: $_"
        exit 1
    }
}
