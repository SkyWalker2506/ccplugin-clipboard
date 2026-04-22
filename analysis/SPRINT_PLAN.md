# ccplugin-clipboard — Sprint Plan

**Date:** 2026-04-22  
**Forge Run:** 1  
**Sprints:** 3 × max 5 tasks

---

## Sprint 1 — Core Fixes

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Add YAML frontmatter to `commands/copy.md` | fix | 5min |
| 2 | Add YAML frontmatter to `commands/paste.md` | fix | 5min |
| 3 | Add YAML frontmatter to `commands/copy-file.md` | fix | 5min |
| 4 | Create `commands/copy-last.md` (copy last Claude output) | feat | 15min |
| 5 | Fix `install.sh` — add `set -e`, remove reference to missing `/copy-last` if not added | fix | 10min |

**Goal:** Plugin command files are consistent with ecosystem standards; install.sh is robust.

---

## Sprint 2 — Enhancement

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Create `commands/clear.md` (clear clipboard) + add `clear` action to `clipboard.sh` | feat | 20min |
| 2 | Translate Turkish strings in `clipboard.sh` to English | fix | 10min |
| 3 | Add `author`, `homepage`, `repository`, `license`, `skills`, `commands` fields to `plugin.json` | fix | 10min |
| 4 | Add `copy-last` and `clear` to `plugin.json` commands list | fix | 5min |
| 5 | Add `.gitignore` (`.DS_Store`, `*.log`) | chore | 5min |

**Goal:** Plugin metadata complete; clipboard.sh is English-first; two new commands added.

---

## Sprint 3 — Polish

| # | Task | Type | Est |
|---|------|------|-----|
| 1 | Rewrite README with usage examples, badges, install instructions (English) | docs | 20min |
| 2 | Add LICENSE file (MIT) | chore | 5min |
| 3 | Bump version to `1.1.0` in `plugin.json` | chore | 2min |
| 4 | Validate all paths in `plugin.json` commands array match actual files | fix | 5min |
| 5 | Final git commit with clean history | chore | 5min |

**Goal:** Repository is production-ready with full documentation and correct metadata.
