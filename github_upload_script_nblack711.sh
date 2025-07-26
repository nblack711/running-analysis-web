#!/bin/bash

# === CONFIGURATION ===
REPO_NAME="gait-analysis-web"
DESCRIPTION="Full-stack prototype gait analysis app with video upload, summary popup, and email reporting."
PRIVATE=false

command -v gh >/dev/null 2>&1 || { echo >&2 "GitHub CLI (gh) is not installed. Aborting."; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "Git is not installed. Aborting."; exit 1; }

echo "Creating GitHub repo: $REPO_NAME"
gh repo create "nblack711/$REPO_NAME" --description "$DESCRIPTION" --public --source=. --remote=origin --push

git init
git add .
git commit -m "Initial commit: Gait analysis web app"
git branch -M main
git remote add origin "https://github.com/nblack711/$REPO_NAME.git"

git push -u origin main

echo "Creating ZIP..."
zip -r ${REPO_NAME}.zip . > /dev/null

gh release create v1.0 ${REPO_NAME}.zip --title "Initial Release" --notes "Full project bundle with frontend, backend, and email module."

echo "✅ Upload complete! Visit: https://github.com/nblack711/${REPO_NAME}"
