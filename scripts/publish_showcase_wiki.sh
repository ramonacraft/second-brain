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
# Wiki-friendly links (drop .md) + absolute image URLs (wiki can't resolve repo-relative paths)
RAW_FLOW="https://raw.githubusercontent.com/ramonacraft/second-brain/main/docs/showcase/flow.png"
python3 - "$TMP/wiki" "$RAW_FLOW" <<'PY'
import sys
from pathlib import Path
wiki = Path(sys.argv[1])
raw = sys.argv[2]
for p in wiki.glob("*.md"):
    t = p.read_text()
    for name in (
        "What-I-Loaded",
        "Architecture-I-Ran",
        "Delivery-Loop-Brain",
        "Compiled-Wiki",
        "Try-It-and-Credits",
    ):
        t = t.replace(f"]({name}.md)", f"]({name})")
    t = t.replace("](flow.png)", f"]({raw})")
    p.write_text(t)
print("wiki markdown normalized")
PY
cd "$TMP/wiki"
git add *.md
if git diff --cached --quiet; then
  echo "No wiki changes."
  exit 0
fi
git commit -m "Update public case study wiki from docs/showcase"
git push origin HEAD:master || git push origin HEAD:main
echo "Published: https://github.com/ramonacraft/second-brain/wiki"
