#!/usr/bin/env bash
# new-entry.sh — 创建今日条目
# 用法: ./scripts/new-entry.sh [slug]
#   slug: 英文 kebab-case，如 "chebyshev-inequality"
#   不传参数则交互式询问
set -eo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TODAY=$(TZ='Asia/Shanghai' date +%Y-%m-%d)
YEAR=$(TZ='Asia/Shanghai' date +%Y)
MONTH=$(TZ='Asia/Shanghai' date +%m)

SLUG="${1:-}"

if [ -z "$SLUG" ]; then
  read -rp "请输入今日主题 slug（kebab-case，如 chebyshev-inequality，直接回车则仅创建日期文件）: " SLUG || SLUG=""
fi

# 规范化 slug：小写、空格转连字符、去除非法字符
if [ -n "$SLUG" ]; then
  SLUG=$(echo "$SLUG" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9-]+/-/g' | sed -E 's/^-+|-+$//g' | sed -E 's/-+/-/g')
fi

if [ -n "$SLUG" ]; then
  DIR="$ROOT/content/$YEAR/$MONTH"
  FILE="$DIR/$TODAY-$SLUG.md"
else
  DIR="$ROOT/content/$YEAR/$MONTH"
  FILE="$DIR/$TODAY.md"
fi

if [ -f "$FILE" ]; then
  echo "[警告] 文件已存在: $FILE"
  read -rp "是否覆盖？(y/N): " ans || ans=""
  if [[ ! "${ans:-}" =~ ^[yY]$ ]]; then
    echo "已取消"
    exit 0
  fi
fi

mkdir -p "$DIR"

TEMPLATE="$ROOT/content/template.md"
if [ ! -f "$TEMPLATE" ]; then
  echo "[错误] 模板不存在: $TEMPLATE"
  exit 1
fi

cp "$TEMPLATE" "$FILE"

# 替换模板中的日期占位
# macOS sed 兼容
if sed --version >/dev/null 2>&1; then
  # GNU sed
  sed -i "s/YYYY-MM-DD/$TODAY/g" "$FILE"
else
  # BSD sed (macOS)
  sed -i '' "s/YYYY-MM-DD/$TODAY/g" "$FILE"
fi

# 若有 slug，尝试更新标题占位
if [ -n "$SLUG" ]; then
  TITLE_HINT=$(echo "$SLUG" | sed -E 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')
  echo "[提示] 标题建议: $TITLE_HINT (请手动改为中文标题)"
fi

echo "[完成] 已创建: $FILE"
echo "   下一步: 编辑文件，填写结论与证明，然后"
echo "   git add \"$FILE\" && git commit -m \"feat: $TODAY - <标题>\" && git push"

# 尝试用 VS Code / 默认编辑器打开（仅交互式终端）
if command -v code >/dev/null 2>&1 && [ -t 0 ]; then
  read -rp "是否用 VS Code 打开？(y/N): " open_ans || open_ans=""
  if [[ "${open_ans:-}" =~ ^[yY]$ ]]; then
    code "$FILE"
  fi
fi
