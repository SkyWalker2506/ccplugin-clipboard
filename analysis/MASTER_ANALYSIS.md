# ccplugin-clipboard — Master Analysis

**Date:** 2026-04-22  
**Analyst:** Forge/Jarvis  
**Version:** 1.0.0

---

## 1. Project Overview

Cross-platform clipboard management plugin for Claude Code. Provides `/copy`, `/paste`, and `/copy-file` commands backed by a shell script (`scripts/clipboard.sh`) that detects the OS/display server and delegates to the appropriate system tool.

**Stack:** Bash, Markdown command definitions, Claude Code plugin system  
**Platforms:** macOS (pbcopy/pbpaste), Linux X11 (xclip/xsel), Linux Wayland (wl-copy/wl-paste), Windows (clip/Get-Clipboard)

---

## 2. Current State

### Files
| File | Purpose | Quality |
|------|---------|---------|
| `scripts/clipboard.sh` | Core copy/paste logic | Good — cross-platform, readable |
| `commands/copy.md` | `/copy` command | Minimal — no description, Turkish only |
| `commands/paste.md` | `/paste` command | Minimal — no description |
| `commands/copy-file.md` | `/copy-file` command | Minimal — no description |
| `install.sh` | Copies files to `~/.claude/plugins/clipboard/` | Works but references `/copy-last` in echo that doesn't exist |
| `.claude-plugin/plugin.json` | Plugin metadata | Version 1.0.0, 3 commands listed |
| `README.md` | Plugin readme | Very minimal — no usage examples, Turkish mixed |

### Strengths
- Clean cross-platform detection logic
- Stdin fallback in copy (pipe support)
- Platform detection exposed as `detect` subcommand

### Issues Found
1. **Missing `/copy-last` command** — `install.sh` mentions it in echo output but command file doesn't exist
2. **No `/clear` command** — can't clear clipboard contents
3. **Turkish-only user messages** in `clipboard.sh` — not consistent with English plugin ecosystem
4. **Command files lack frontmatter** — no `description:` or `allowed-tools:` headers (inconsistent with daily-check/devtools patterns)
5. **`install.sh` `set -e` missing** — errors won't abort install
6. **No `CLAUDE.md` project-level docs** — minimal, no install instructions
7. **No `.gitignore`** — `.DS_Store` is untracked
8. **No LICENSE file**
9. **`plugin.json` missing `author`, `homepage`, `skills` fields** — other plugins have these
10. **README.md** — very sparse, no usage examples, doesn't match the quality of daily-check README

---

## 3. Gap Analysis

| Area | Gap | Priority |
|------|-----|---------|
| Missing command | `/copy-last` referenced but absent | High |
| Missing command | `/clear` (clear clipboard) | Medium |
| Command frontmatter | All 3 command .md files missing YAML frontmatter | High |
| Script messages | Turkish error/success strings → English | Medium |
| Install robustness | `set -e`, error handling | Medium |
| Metadata | `plugin.json` incomplete fields | Low |
| Docs | README sparse, no examples | Medium |
| Housekeeping | `.gitignore`, LICENSE | Low |

---

## 4. Recommended Sprint Structure

### Sprint 1 — Core Fixes (high priority)
- Add YAML frontmatter to all 3 command files
- Create missing `/copy-last` command (copy last Claude output)
- Add `set -e` and proper error handling to `install.sh`

### Sprint 2 — Enhancement
- Add `/clear` command (clear clipboard)
- Translate error/success messages in `clipboard.sh` to English
- Complete `plugin.json` with author, homepage, skills fields
- Add `.gitignore`

### Sprint 3 — Polish
- Rewrite README with full usage examples, badges, install instructions
- Add LICENSE (MIT)
- Validate command paths in `plugin.json` match actual files
- Add `copy-last` to plugin.json commands list
