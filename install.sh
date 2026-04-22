#!/bin/bash
set -euo pipefail

PLUGIN_NAME="clipboard"
INSTALL_DIR="$HOME/.claude/plugins/$PLUGIN_NAME"

echo "📋 ccplugin-clipboard kurulum başlıyor..."

OS="$(uname -s)"

if [ "$OS" = "Linux" ]; then
  if [ -n "$WAYLAND_DISPLAY" ]; then
    command -v wl-copy &>/dev/null || { echo "📦 wl-clipboard kuruluyor..."; sudo apt-get install -y wl-clipboard 2>/dev/null || echo "⚠️  Manuel kur: sudo apt install wl-clipboard"; }
  else
    command -v xclip &>/dev/null || { echo "📦 xclip kuruluyor..."; sudo apt-get install -y xclip 2>/dev/null || echo "⚠️  Manuel kur: sudo apt install xclip"; }
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$INSTALL_DIR/scripts" "$INSTALL_DIR/commands" "$INSTALL_DIR/.claude-plugin"

if [ "$SCRIPT_DIR" != "$INSTALL_DIR" ]; then
  cp "$SCRIPT_DIR/scripts/"*.sh "$INSTALL_DIR/scripts/"
  cp "$SCRIPT_DIR/commands/"*.md "$INSTALL_DIR/commands/"
  cp "$SCRIPT_DIR/.claude-plugin/plugin.json" "$INSTALL_DIR/.claude-plugin/"
fi

chmod +x "$INSTALL_DIR/scripts/"*.sh

echo "✅ ccplugin-clipboard installed!"
echo "Commands: /copy, /paste, /copy-file, /copy-last, /clear"
