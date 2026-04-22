# Forge Run 1 Lessons — ccplugin-clipboard

## Key Findings

1. **Turkish-only messages are a gap** — plugin ecosystem users expect English. Always audit user-facing strings early.
2. **Command files without frontmatter** cause inconsistent behavior in skill routing — frontmatter is required, not optional.
3. **install.sh missing set -e** is a common oversight in shell scripts — always add set -euo pipefail to install scripts.
4. **Plugin.json commands array** must list all commands including new ones added post-release.
5. **Remote main had diverged commits** — always `git fetch` before starting work to avoid rebase conflicts.

## Process Notes

- Used bash heredoc writes when tool Write failed due to file-modified-since-read state
- Sprint branching worked smoothly for isolation
- Direct merge to main (no PR merge) faster when remote branch divergence is an issue

## Recommendations for Run 2

- Consider adding a `skills/` directory with a SKILL.md for clipboard auto-trigger
- Could add `/copy-selection` for copying terminal selection
