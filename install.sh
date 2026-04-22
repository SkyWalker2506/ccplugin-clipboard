#!/bin/bash
set -euo pipefail

PLUGIN_NAME="clipboard"
INSTALL_DIR="$HOME/.claude/plugins/$PLUGIN_NAME"

echo "📋 ccplugin-clipboard install starting..."

OS="$(uname -s)"

if [ "$OS" = "Linux" ]; then
  if [ -n "${WAYLAND_DISPLAY:-}" ]; then
    command -v wl-copy &>/dev/null || { echo "📦 Installing wl-clipboard..."; sudo apt-get install -y wl-clipboard 2>/dev/null || echo "⚠️  Manual install: sudo apt install wl-clipboard"; }
  else
    command -v xclip &>/dev/null || { echo "📦 Installing xclip..."; sudo apt-get install -y xclip 2>/dev/null || echo "⚠️  Manual install: sudo apt install xclip"; }
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$INSTALL_DIR/scripts" "$INSTALL_DIR/commands" "$INSTALL_DIR/.claude-plugin" "$INSTALL_DIR/skills/clipboard"

if [ "$SCRIPT_DIR" != "$INSTALL_DIR" ]; then
  cp "$SCRIPT_DIR/scripts/"*.sh "$INSTALL_DIR/scripts/"
  cp "$SCRIPT_DIR/commands/"*.md "$INSTALL_DIR/commands/"
  cp "$SCRIPT_DIR/.claude-plugin/plugin.json" "$INSTALL_DIR/.claude-plugin/"
  [ -f "$SCRIPT_DIR/skills/clipboard/SKILL.md" ] && cp "$SCRIPT_DIR/skills/clipboard/SKILL.md" "$INSTALL_DIR/skills/clipboard/"
fi

chmod +x "$INSTALL_DIR/scripts/"*.sh

echo "✅ ccplugin-clipboard installed at $INSTALL_DIR"
echo "Commands: /copy, /paste, /copy-file, /copy-last, /clear"
