# Forge Run 2 Lessons — ccplugin-clipboard

## Key Findings

1. **skills/ directory adds real value** — having a SKILL.md means the plugin auto-triggers in Claude sessions without users typing commands
2. **install.sh must copy all plugin assets** — initially forgot to copy skills/ directory; fixed in sprint 2
3. **set -euo pipefail breaks on unbound vars** — WAYLAND_DISPLAY may not be set on macOS; must use ${VAR:-} syntax
4. **copy-selection is a high-value command** — many users need to copy specific lines or grep output; worth adding early

## Process Notes

- Run 2 was smoother than Run 1 — no branch conflicts
- Incremental improvement pattern (sprints building on Run 1 results) works well

## Recommendations for Run 3

- Add `copy-url` command (copy URL from argument or auto-detect URL in context)
- Consider adding integration tests / smoke test script
