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
        if ($line -cmatch '^(?<key>[a-z_]+)\s*=\s*"(?<value>[^"]*)"
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
            Assert-SafeRelativePath $value
            $current[$key] = $value
        } else { throw 'Manifest field outside a section' }
    }
    if (-not $versionFile -or $records.Count -eq 0) { throw 'Incomplete manifest' }

    $destinations = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($item in $records) {
        if ($item.Count -ne 2 -or -not $item.ContainsKey('source') -or
            -not $item.ContainsKey('destination')) { throw 'Incomplete file mapping' }
        if (-not $destinations.Add($item.destination)) { throw "Duplicate destination: $($item.destination)" }
        $source = Join-Path $Root $item.source
        if (-not [IO.File]::Exists($source) -or (Get-Item -LiteralPath $source).Attributes -band
            [IO.FileAttributes]::ReparsePoint) {
            throw "Missing or linked source: $($item.source)"
        }
        $directory = Split-Path $source -Parent
        while ($directory -ne $Root) {
            if ((Get-Item -LiteralPath $directory).Attributes -band
                [IO.FileAttributes]::ReparsePoint) { throw "Linked source directory: $directory" }
            $directory = Split-Path $directory -Parent
        }
    }
    if (-not $destinations.Contains('README.md') -or -not $destinations.Contains('VERSION')) {
        throw 'Manifest must include README.md and VERSION'
    }
    return @($records.ToArray())
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
                    $hash = [Security.Cryptography.SHA256]::HashData($entryStream)
                } finally { $entryStream.Dispose() }
                $fileHash = [Security.Cryptography.SHA256]::HashData(
                    [IO.File]::ReadAllBytes((Join-Path $product $relative)))
                if ([Convert]::ToHexString($hash) -cne [Convert]::ToHexString($fileHash)) {
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

try { Invoke-DldPackage $RepositoryRoot } catch {
    Write-Error "DLD packaging failed: $_"
    exit 1
}
) {
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
            Assert-SafeRelativePath $value
            $current[$key] = $value
        } else { throw 'Manifest field outside a section' }
    }
    if (-not $versionFile -or $records.Count -eq 0) { throw 'Incomplete manifest' }

    $destinations = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($item in $records) {
        if ($item.Count -ne 2 -or -not $item.ContainsKey('source') -or
            -not $item.ContainsKey('destination')) { throw 'Incomplete file mapping' }
        if (-not $destinations.Add($item.destination)) { throw "Duplicate destination: $($item.destination)" }
        $source = Join-Path $Root $item.source
        if (-not [IO.File]::Exists($source) -or (Get-Item -LiteralPath $source).Attributes -band
            [IO.FileAttributes]::ReparsePoint) {
            throw "Missing or linked source: $($item.source)"
        }
        $directory = Split-Path $source -Parent
        while ($directory -ne $Root) {
            if ((Get-Item -LiteralPath $directory).Attributes -band
                [IO.FileAttributes]::ReparsePoint) { throw "Linked source directory: $directory" }
            $directory = Split-Path $directory -Parent
        }
    }
    if (-not $destinations.Contains('README.md') -or -not $destinations.Contains('VERSION')) {
        throw 'Manifest must include README.md and VERSION'
    }
    return @($records.ToArray())
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
                    $hash = [Security.Cryptography.SHA256]::HashData($entryStream)
                } finally { $entryStream.Dispose() }
                $fileHash = [Security.Cryptography.SHA256]::HashData(
                    [IO.File]::ReadAllBytes((Join-Path $product $relative)))
                if ([Convert]::ToHexString($hash) -cne [Convert]::ToHexString($fileHash)) {
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

try { Invoke-DldPackage $RepositoryRoot } catch {
    Write-Error "DLD packaging failed: $_"
    exit 1
}
