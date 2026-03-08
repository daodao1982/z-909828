#!/usr/bin/env bash
set -e
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
sudo install -m 0755 "$SRC_DIR/z" /usr/local/bin/z
echo "安装完成，输入 z 启动：勤💩皇工具箱"
