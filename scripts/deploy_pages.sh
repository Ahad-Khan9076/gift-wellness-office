#!/usr/bin/env bash
# Build Flutter web and publish to the gh-pages branch on GitHub.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPO="${GITHUB_REPO:-Ahad-Khan9076/gift-wellness-office}"
BASE_HREF="/gift-wellness-office/"

cd "$ROOT"
flutter pub get
flutter build web --release --base-href "$BASE_HREF"

DEPLOY_DIR="$(mktemp -d)"
cp -R build/web/. "$DEPLOY_DIR/"
cd "$DEPLOY_DIR"
git init -b gh-pages
git add -A
git commit -m "Deploy Flutter web to GitHub Pages"
git remote add origin "https://github.com/${REPO}.git"
git push -f origin gh-pages

echo "Live at: https://ahad-khan9076.github.io/gift-wellness-office/"
