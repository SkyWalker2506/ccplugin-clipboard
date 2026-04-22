#!/bin/bash
# Cross-platform clipboard utility
# Usage: clipboard.sh copy [text]   — copy text (or stdin) to clipboard
#        clipboard.sh paste         — print clipboard contents
#        clipboard.sh clear         — clear clipboard contents
#        clipboard.sh detect        — print detected platform

ACTION="${1:-copy}"
shift

_detect_platform() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux)
      if [ -n "$WAYLAND_DISPLAY" ] && command -v wl-copy &>/dev/null; then
        echo "wayland"
      elif command -v xclip &>/dev/null; then
        echo "xclip"
      elif command -v xsel &>/dev/null; then
        echo "xsel"
      else
        echo "unknown"
      fi
      ;;
    MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
    *) echo "unknown" ;;
  esac
}

_copy() {
  local platform
  platform=$(_detect_platform)
  case "$platform" in
    macos)   echo -n "$1" | pbcopy ;;
    wayland) echo -n "$1" | wl-copy ;;
    xclip)   echo -n "$1" | xclip -selection clipboard ;;
    xsel)    echo -n "$1" | xsel --clipboard --input ;;
    windows) echo -n "$1" | clip ;;
    *)
      echo "❌ No clipboard tool found." >&2
      echo "   Linux: sudo apt install xclip  or  sudo apt install wl-clipboard" >&2
      exit 1
      ;;
  esac
}

_paste() {
  local platform
  platform=$(_detect_platform)
  case "$platform" in
    macos)   pbpaste ;;
    wayland) wl-paste ;;
    xclip)   xclip -selection clipboard -o ;;
    xsel)    xsel --clipboard --output ;;
    windows) powershell.exe -command "Get-Clipboard" 2>/dev/null ;;
    *)
      echo "❌ No clipboard tool found." >&2
      exit 1
      ;;
  esac
}

_clear() {
  local platform
  platform=$(_detect_platform)
  case "$platform" in
    macos)   echo -n "" | pbcopy ;;
    wayland) wl-copy --clear ;;
    xclip)   echo -n "" | xclip -selection clipboard ;;
    xsel)    echo -n "" | xsel --clipboard --input ;;
    windows) echo "" | clip ;;
    *)
      echo "❌ No clipboard tool found." >&2
      exit 1
      ;;
  esac
}

case "$ACTION" in
  copy)
    if [ "$#" -gt 0 ]; then
      TEXT="$*"
    else
      TEXT=$(cat)
    fi
    _copy "$TEXT"
    echo "✅ Copied ($(echo -n "$TEXT" | wc -c | tr -d ' ') characters)"
    ;;
  paste)
    _paste
    ;;
  clear)
    _clear
    echo "✅ Clipboard cleared"
    ;;
  detect)
    _detect_platform
    ;;
  *)
    echo "Usage: clipboard.sh copy [text] | paste | clear | detect" >&2
    exit 1
    ;;
esac
