#!/usr/bin/env bash
# Local release build, then deploy output folder to Vercel (CLI).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

bash scripts/vercel_build.sh

echo ""
echo "Deploying build/web to Vercel..."
cd build/web
if command -v vercel >/dev/null 2>&1; then
  vercel --prod
else
  npx --yes vercel@latest --prod
fi
