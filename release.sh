#!/bin/bash
set -e

VERSION=${1:?使い方: ./release.sh vNN}

ITCH_USER="migy-craft"
ITCH_GAME="ano-lumber-camp"
ITCH_CHANNEL="html"
HTML_FILE="lumber-camp.html"
BUTLER="${HOME}/.local/bin/butler"

echo "=== リリース: ${VERSION} ==="

# CHANGELOGに該当バージョンが書かれているか確認
if ! grep -q "## \[${VERSION}\]" CHANGELOG.md; then
  echo "❌ CHANGELOG.md に [${VERSION}] のエントリがありません。追記してから再実行してください。"
  exit 1
fi

# git commit
git add ${HTML_FILE} CHANGELOG.md
git commit -m "${VERSION}: $(grep -A1 "## \[${VERSION}\]" CHANGELOG.md | tail -1)"

# tag & push
git tag ${VERSION}
git push origin main
git push origin ${VERSION}

# GitHub Release（HTMLを添付）
NOTES=$(awk "/## \[${VERSION}\]/{found=1; next} found && /^## /{exit} found{print}" CHANGELOG.md)
gh release create ${VERSION} ${HTML_FILE} \
  --title "${VERSION}" \
  --notes "${NOTES}"

# itch.io へアップロード
echo "--- itch.io へアップロード中 ---"
${BUTLER} push ${HTML_FILE} ${ITCH_USER}/${ITCH_GAME}:${ITCH_CHANNEL} --userversion ${VERSION}

echo ""
echo "✅ 完了!"
echo "   GitHub: https://github.com/woopsdez/lumber-camp/releases/tag/${VERSION}"
echo "   itch:   https://${ITCH_USER}.itch.io/${ITCH_GAME}"
