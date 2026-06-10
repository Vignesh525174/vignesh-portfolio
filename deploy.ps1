param(
    [string]$RemoteUrl
)

if (-not $RemoteUrl) {
    $RemoteUrl = Read-Host "Enter remote URL (git@github.com:USER/REPO.git or https://github.com/USER/REPO.git)"
}

Write-Host "Using remote: $RemoteUrl"

# Ensure git is available
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "git is not installed or not in PATH. Install Git and retry."
    exit 1
}

# Add or update origin remote
$existing = git remote | Select-String -Pattern '^origin$' -Quiet
if ($existing) {
    git remote set-url origin $RemoteUrl
    if ($LASTEXITCODE -ne 0) { Write-Error "Failed to set remote URL"; exit 1 }
} else {
    git remote add origin $RemoteUrl
    if ($LASTEXITCODE -ne 0) { Write-Error "Failed to add remote"; exit 1 }
}

# Push branches
Write-Host "Pushing 'main' branch..."
git push -u origin main
if ($LASTEXITCODE -ne 0) { Write-Error "Failed to push 'main'"; exit 1 }

Write-Host "Pushing 'gh-pages' branch..."
git push -u origin gh-pages
if ($LASTEXITCODE -ne 0) { Write-Error "Failed to push 'gh-pages'"; exit 1 }

Write-Host "Push complete. Enable GitHub Pages on branch 'gh-pages' in repository settings if needed."