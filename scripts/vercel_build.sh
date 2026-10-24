#!/usr/bin/env bash
# Builds Flutter web on Vercel (and locally). Installs Flutter if missing.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

FLUTTER_DIR="${FLUTTER_ROOT:-${HOME}/.flutter}"
if [ ! -x "$FLUTTER_DIR/bin/flutter" ]; then
  echo "Installing Flutter (stable)..."
  rm -rf "$FLUTTER_DIR"
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"
flutter --version
flutter config --enable-web --no-analytics
flutter pub get
flutter build web --release

echo "Built: $ROOT/build/web"
