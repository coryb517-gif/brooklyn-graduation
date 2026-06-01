# ============================================================
# Brooklyn Payge Bracy - Graduation Slideshow
# Setup, GitHub Push & Vercel Deploy Script
# ============================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  Brooklyn Payge Bracy - Class of 2025  " -ForegroundColor White
Write-Host "  Setting up your graduation slideshow  " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Magenta
Write-Host ""

$projectPath = "C:\projects\brooklyn-graduation"
$githubUser  = "coryb517-gif"
$repoName    = "brooklyn-graduation"

# ── STEP 1: Create folder structure ──────────────────────────
Write-Host ">> Step 1: Creating folder structure..." -ForegroundColor Yellow

$folders = @(
    "$projectPath",
    "$projectPath\music",
    "$projectPath\photos\2007-baby",
    "$projectPath\photos\2008-toddler",
    "$projectPath\photos\2009-toddler",
    "$projectPath\photos\2010-elementary",
    "$projectPath\photos\2011-elementary",
    "$projectPath\photos\2012-elementary",
    "$projectPath\photos\2013-middle",
    "$projectPath\photos\2014-middle",
    "$projectPath\photos\2015-middle",
    "$projectPath\photos\2016-highschool",
    "$projectPath\photos\2017-highschool",
    "$projectPath\photos\2018-highschool",
    "$projectPath\photos\2019-highschool",
    "$projectPath\photos\2020-highschool",
    "$projectPath\photos\2021-highschool",
    "$projectPath\photos\2022-highschool",
    "$projectPath\photos\2023-senior",
    "$projectPath\photos\2024-senior",
    "$projectPath\photos\2025-graduation",
    "$projectPath\photos\2025-cmu"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Host "   Created: $folder" -ForegroundColor Green
    } else {
        Write-Host "   Exists:  $folder" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "   Folder structure ready!" -ForegroundColor Green
Write-Host ""

# ── STEP 2: Copy project files ────────────────────────────────
Write-Host ">> Step 2: Checking project files..." -ForegroundColor Yellow

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$filesToCopy = @("index.html", "vercel.json", "README.md", ".gitignore")

foreach ($file in $filesToCopy) {
    $src = Join-Path $scriptDir $file
    $dst = Join-Path $projectPath $file
    if (Test-Path $src) {
        Copy-Item $src $dst -Force
        Write-Host "   Copied: $file" -ForegroundColor Green
    } elseif (Test-Path $dst) {
        Write-Host "   Found:  $file" -ForegroundColor Gray
    } else {
        Write-Host "   MISSING: $file - please place it in $projectPath" -ForegroundColor Red
    }
}

Write-Host ""

# ── STEP 3: Git init & commit ─────────────────────────────────
Write-Host ">> Step 3: Initializing Git repository..." -ForegroundColor Yellow

Set-Location $projectPath

# Add .gitkeep to empty photo folders so Git tracks them
Get-ChildItem -Path "$projectPath\photos" -Directory | ForEach-Object {
    $keep = Join-Path $_.FullName ".gitkeep"
    if (-not (Test-Path $keep)) {
        New-Item -ItemType File -Path $keep -Force | Out-Null
    }
}

git init 2>&1 | Out-Null
git config user.email "coryb517-gif@users.noreply.github.com"
git config user.name "coryb517-gif"

git add .
git commit -m "Initial commit - Brooklyn Payge Bracy graduation slideshow" 2>&1 | Out-Null
git branch -M main

Write-Host "   Git repository initialized and committed!" -ForegroundColor Green
Write-Host ""

# ── STEP 4: Create GitHub repo via API ───────────────────────
Write-Host ">> Step 4: Creating GitHub repository..." -ForegroundColor Yellow
Write-Host ""
Write-Host "   You'll need a GitHub Personal Access Token." -ForegroundColor Cyan
Write-Host "   Get one at: https://github.com/settings/tokens/new" -ForegroundColor Cyan
Write-Host "   Required scope: repo (check the 'repo' checkbox)" -ForegroundColor Cyan
Write-Host ""

$token = Read-Host "   Paste your GitHub token here (it won't show as you type)"

$headers = @{
    "Authorization" = "token $token"
    "Accept"        = "application/vnd.github.v3+json"
    "User-Agent"    = "brooklyn-graduation-setup"
}

$body = @{
    name        = $repoName
    description = "Brooklyn Payge Bracy - Graduation Slideshow - Class of 2025"
    private     = $false
    auto_init   = $false
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod `
        -Uri "https://api.github.com/user/repos" `
        -Method POST `
        -Headers $headers `
        -Body $body `
        -ContentType "application/json"

    Write-Host "   GitHub repo created: $($response.html_url)" -ForegroundColor Green
    $repoUrl = $response.clone_url
} catch {
    # Repo may already exist
    Write-Host "   Repo may already exist - connecting to existing repo..." -ForegroundColor Yellow
    $repoUrl = "https://github.com/$githubUser/$repoName.git"
}

Write-Host ""

# ── STEP 5: Push to GitHub ────────────────────────────────────
Write-Host ">> Step 5: Pushing to GitHub..." -ForegroundColor Yellow

$authUrl = $repoUrl -replace "https://", "https://${token}@"
git remote remove origin 2>&1 | Out-Null
git remote add origin $authUrl
git push -u origin main 2>&1

Write-Host ""
Write-Host "   Pushed to GitHub!" -ForegroundColor Green
Write-Host "   View at: https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
Write-Host ""

# ── STEP 6: Deploy to Vercel ──────────────────────────────────
Write-Host ">> Step 6: Deploying to Vercel..." -ForegroundColor Yellow
Write-Host ""
Write-Host "   Launching Vercel deployment..." -ForegroundColor Cyan
Write-Host "   When prompted:" -ForegroundColor White
Write-Host "     - Set up and deploy? -> Y" -ForegroundColor White
Write-Host "     - Which scope? -> coryb517-gif's projects" -ForegroundColor White
Write-Host "     - Link to existing project? -> N" -ForegroundColor White
Write-Host "     - Project name? -> brooklyn-graduation" -ForegroundColor White
Write-Host "     - In which directory? -> ./ (just press Enter)" -ForegroundColor White
Write-Host ""

vercel --prod --yes --name $repoName 2>&1

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  ALL DONE! Brooklyn's site is live!    " -ForegroundColor White
Write-Host "========================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Cyan
Write-Host "  1. Add photos to C:\projects\brooklyn-graduation\photos\" -ForegroundColor White
Write-Host "  2. Add never-grow-up.mp3 to the music\ folder" -ForegroundColor White
Write-Host "  3. Update photo filenames in index.html" -ForegroundColor White
Write-Host "  4. Run: cd C:\projects\brooklyn-graduation" -ForegroundColor White
Write-Host "          git add ." -ForegroundColor White
Write-Host "          git commit -m 'Added photos'" -ForegroundColor White
Write-Host "          git push" -ForegroundColor White
Write-Host "  5. Vercel auto-deploys on every push!" -ForegroundColor White
Write-Host ""
Write-Host "  Venmo gift link: @Brooklyn-Bracy-1" -ForegroundColor Green
Write-Host "  Fire Up Chips! Go Brooklyn!" -ForegroundColor Magenta
Write-Host ""

