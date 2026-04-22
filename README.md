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
| `/copy-selection <file> <range>` | Copy line range or pattern from file |
| `/copy-url <url or text>` | Copy URL to clipboard (or auto-extract from text) |
| `/clear` | Clear clipboard contents |

## Usage Examples

```
/copy Hello world                        # Copies "Hello world"
/paste                                   # Prints clipboard contents
/copy-file /tmp/notes.txt               # Copies file contents
/copy-last                               # Copies last Claude reply
/copy-selection main.py 10:25           # Copies lines 10–25
/copy-url https://example.com           # Copies URL
/copy-url "see https://example.com"     # Extracts and copies URL from text
/clear                                   # Empties clipboard
```

## Platform Support

| Platform | Tool Used |
|----------|-----------|
| macOS | `pbcopy` / `pbpaste` |
| Linux (X11) | `xclip` |
| Linux (Wayland) | `wl-copy` / `wl-paste` |
| Windows | `clip` / `Get-Clipboard` |

Linux users: install `xclip` (`sudo apt install xclip`) or `wl-clipboard` (`sudo apt install wl-clipboard`) as needed.

## Testing

Run the smoke test to verify clipboard.sh works on your system:

```bash
bash scripts/test-clipboard.sh
```

## License

MIT

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (134 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 18 plugins
- [ClaudeHQ](https://github.com/SkyWalker2506/ClaudeHQ) — Claude ecosystem HQ
