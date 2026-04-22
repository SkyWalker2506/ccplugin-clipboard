---
name: clipboard
description: "Clipboard management skill. Activates when user says: copy this, copy to clipboard, paste, show clipboard, clear clipboard, copy file, copy last response, what's in my clipboard."
version: 1.1.0
---

# Clipboard Skill

Cross-platform clipboard management for Claude Code.

## Trigger Phrases

| Intent | Phrases | Routes To |
|--------|---------|-----------|
| Copy text | copy this, copy to clipboard, kopyala | `/copy` |
| Paste | paste, show clipboard, clipboard contents | `/paste` |
| Copy file | copy file, dosyayı kopyala | `/copy-file` |
| Copy last | copy last response, copy that | `/copy-last` |
| Clear | clear clipboard, temizle | `/clear` |

## Platform Support

Automatically detects: macOS (pbcopy), Linux X11 (xclip), Linux Wayland (wl-copy), Windows (clip).

## Dependencies

Requires `scripts/clipboard.sh` installed at `~/.claude/plugins/clipboard/scripts/clipboard.sh`.
Run `bash install.sh` from the plugin directory to set up.
| Copy selection | copy lines, copy section, copy range | `/copy-selection` |
