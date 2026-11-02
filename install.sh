#!/usr/bin/env bash
# Cài vn-law-check vào project hiện tại (hoặc thư mục chỉ định).
# Dùng: curl -fsSL https://raw.githubusercontent.com/mhfed/vn-law-check/main/install.sh | bash
# Hoặc: ./install.sh /path/to/project

set -euo pipefail

REPO="https://github.com/mhfed/vn-law-check"
TARGET="${1:-.}"
TMP="$(mktemp -d)"

cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

echo "Đang tải vn-law-check..."
git clone --depth 1 --quiet "$REPO" "$TMP"

mkdir -p "$TARGET/.cursor/rules" "$TARGET/.github" "$TARGET/checklists" "$TARGET/sources" "$TARGET/examples"

cp "$TMP/AGENTS.md" "$TARGET/"
cp "$TMP/CLAUDE.md" "$TARGET/"
cp "$TMP/.windsurfrules" "$TARGET/"
cp "$TMP/.clinerules" "$TARGET/"
cp "$TMP/.cursor/rules/vn-legal-compliance.mdc" "$TARGET/.cursor/rules/"
cp "$TMP/.github/copilot-instructions.md" "$TARGET/.github/"
cp "$TMP"/checklists/*.md "$TARGET/checklists/"
cp "$TMP"/sources/*.md "$TARGET/sources/"
cp "$TMP"/examples/*.md "$TARGET/examples/"
cp "$TMP/DISCLAIMER.md" "$TARGET/"

echo "Đã copy vn-law-check vào $TARGET"
echo "Mở agent/IDE của bạn (Claude, Cursor, Windsurf, Copilot, Cline) và yêu cầu:"
echo "  \"Audit website này theo checklist pháp lý VN trong repo\""
