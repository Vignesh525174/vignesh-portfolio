#!/usr/bin/env bash
set -euo pipefail

REMOTE_URL="${1:-}"

if [ -z "$REMOTE_URL" ]; then
  read -rp "Enter remote URL (git@github.com:USER/REPO.git or https://github.com/USER/REPO.git): " REMOTE_URL
fi

echo "Using remote: $REMOTE_URL"

if ! command -v git >/dev/null 2>&1; then
  echo "git is not installed or not in PATH. Install Git and retry." >&2
  exit 1
fi

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

echo "Pushing 'main' branch..."
git push -u origin main

echo "Pushing 'gh-pages' branch..."
git push -u origin gh-pages

echo "Push complete. Enable GitHub Pages on branch 'gh-pages' in repository settings if needed."