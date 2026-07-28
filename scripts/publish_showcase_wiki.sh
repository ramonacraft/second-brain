#!/usr/bin/env bash
# Push docs/showcase to the GitHub Wiki remote.
# Prerequisite: create the first Wiki page once in the GitHub UI
#   https://github.com/ramonacraft/second-brain/wiki/_new
# then run: ./scripts/publish_showcase_wiki.sh
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/docs/showcase"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
git clone "https://github.com/ramonacraft/second-brain.wiki.git" "$TMP/wiki"
cp "$SRC"/*.md "$TMP/wiki/"
# GitHub Wiki home page must be named Home.md
if [ -f "$TMP/wiki/README.md" ]; then
  cp "$TMP/wiki/README.md" "$TMP/wiki/Home.md"
fi
cd "$TMP/wiki"
git add *.md
if git diff --cached --quiet; then
  echo "No wiki changes."
  exit 0
fi
git commit -m "Update public case study wiki from docs/showcase"
git push origin HEAD:master || git push origin HEAD:main
echo "Published: https://github.com/ramonacraft/second-brain/wiki"
