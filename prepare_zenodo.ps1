# Prepared in collaboration with ChatGPT5 via Lawrence Berkeley National Laboratory's CBorg interface

$ErrorActionPreference = "Stop"

Write-Host "=== Zenodo Release Preparation Script ===" -ForegroundColor Cyan

# 1. Ensure Git LFS is installed
if (-not (Get-Command git-lfs -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Git LFS is not installed. Please install it first." -ForegroundColor Red
    exit 1
}

# 2. Move to repo root
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)

# 3. Pull all Git LFS files
Write-Host "📥 Pulling all Git LFS files..."
git lfs pull

# 4. Check for missing LFS files
$missing = git lfs ls-files | Select-String "\(missing\)"
if ($missing) {
    Write-Host "❌ Some LFS files are missing:" -ForegroundColor Red
    $missing
    exit 1
}

# 5. Add .gitkeep to empty folders
Write-Host "🗂 Adding .gitkeep to empty folders..."
Get-ChildItem -Recurse -Directory | ForEach-Object {
    if (-not (Get-ChildItem $_.FullName -Force | Where-Object { -not $_.PSIsContainer })) {
        $gitkeepPath = Join-Path $_.FullName ".gitkeep"
        if (-not (Test-Path $gitkeepPath)) {
            New-Item -ItemType File -Path $gitkeepPath -Force | Out-Null
            Write-Host "   Added .gitkeep to $($_.FullName)"
        }
    }
}

# 6. Create ZIP file name
$zipName = "full_release_$((Get-Date).ToString('yyyyMMdd')).zip"

# 7. Create a staging folder
$stagingDir = Join-Path $env:TEMP "zenodo_staging"
if (Test-Path $stagingDir) { Remove-Item $stagingDir -Recurse -Force }
New-Item -ItemType Directory -Path $stagingDir | Out-Null

# 8. Copy tracked files to staging folder, preserving structure
Write-Host "📄 Copying tracked files to staging folder..."
git ls-files | ForEach-Object {
    $source = $_
    $destination = Join-Path $stagingDir $_
    $destDir = Split-Path $destination -Parent
    if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
    Copy-Item $source $destination -Force
}

# 9. Create ZIP from staging folder (preserves structure)
Write-Host "📦 Creating ZIP archive with preserved structure: $zipName"
if (Test-Path $zipName) { Remove-Item $zipName -Force }
Compress-Archive -Path (Join-Path $stagingDir '*') -DestinationPath $zipName -Force

# 10. Clean up staging folder
Remove-Item $stagingDir -Recurse -Force

Write-Host "✅ Archive created: $zipName" -ForegroundColor Green
Write-Host "➡ Attach this ZIP as a release asset on GitHub so Zenodo archives the full dataset."