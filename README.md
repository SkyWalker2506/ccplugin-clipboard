# clipboard — Claude Code Plugin

by [Musab Kara](https://linkedin.com/in/musab-kara-85580612a) · [GitHub](https://github.com/SkyWalker2506)

Cross-platform clipboard manager for Claude Code — macOS, Linux (X11/Wayland), Windows.

## Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/SkyWalker2506/claude-marketplace/main/install.sh) clipboard
```

Or via Claude Code native marketplace:

```bash
claude plugin install clipboard@musabkara-claude-marketplace
```

Or manually:

```bash
git clone https://github.com/SkyWalker2506/ccplugin-clipboard.git
cd ccplugin-clipboard && bash install.sh
```

## Commands

| Command | Description |
|---------|-------------|
| `/copy <text>` | Copy text to clipboard |
| `/paste` | Print clipboard contents to terminal |
| `/copy-file <path>` | Copy file contents to clipboard |
| `/copy-last` | Copy last Claude response to clipboard |
| `/clear` | Clear clipboard contents |

## Usage Examples

```
/copy Hello world          # Copies "Hello world" to clipboard
/paste                     # Prints clipboard contents
/copy-file /tmp/notes.txt  # Copies file contents
/copy-last                 # Copies last Claude reply
/clear                     # Empties clipboard
```

## Platform Support

| Platform | Tool Used |
|----------|-----------|
| macOS | `pbcopy` / `pbpaste` |
| Linux (X11) | `xclip` |
| Linux (Wayland) | `wl-copy` / `wl-paste` |
| Windows | `clip` / `Get-Clipboard` |

Linux users: install `xclip` (`sudo apt install xclip`) or `wl-clipboard` (`sudo apt install wl-clipboard`) as needed.

## License

MIT

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (134 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 18 plugins
- [ClaudeHQ](https://github.com/SkyWalker2506/ClaudeHQ) — Claude ecosystem HQ
