#!/usr/bin/env bash
set -euo pipefail

# 优先使用本地同目录 z（git clone 场景）
# 若不存在（curl | bash 场景），则从 GitHub Raw 拉取。
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
LOCAL_Z="$SRC_DIR/z"
RAW_Z_URL="https://raw.githubusercontent.com/daodao1982/z-909828/main/z"

if [[ -f "$LOCAL_Z" ]]; then
  SRC_Z="$LOCAL_Z"
else
  SRC_Z="$(mktemp)"
  trap 'rm -f "$SRC_Z"' EXIT
  curl -fsSL "$RAW_Z_URL" -o "$SRC_Z"
fi

if [[ "$EUID" -eq 0 ]]; then
  install -m 0755 "$SRC_Z" /usr/local/bin/z
else
  sudo install -m 0755 "$SRC_Z" /usr/local/bin/z
fi

echo "安装完成，输入 z 启动：勤💩皇工具箱"
