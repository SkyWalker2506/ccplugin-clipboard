# ccplugin-clipboard

> See global rules: `~/Projects/claude-config/CLAUDE.md`

## Project

Cross-platform clipboard plugin for Claude Code.

**Repo:** https://github.com/SkyWalker2506/ccplugin-clipboard  
**Version:** 1.1.0

## Commands

- `/copy <text>` — copy text to clipboard
- `/paste` — print clipboard contents
- `/copy-file <path>` — copy file to clipboard
- `/copy-last` — copy last Claude response
- `/clear` — clear clipboard

## Key Files

- `scripts/clipboard.sh` — core logic (copy, paste, clear, detect)
- `commands/*.md` — command definitions with YAML frontmatter
- `skills/clipboard/SKILL.md` — auto-trigger skill
- `.claude-plugin/plugin.json` — plugin metadata
- `install.sh` — copies files to `~/.claude/plugins/clipboard/`
