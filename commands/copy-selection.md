---
description: Copy a specific line range or pattern from a file to clipboard. Usage: /copy-selection <file> <start>:<end> or <file> <pattern>
allowed-tools: [Bash]
---

# /copy-selection

Copy a specific section of a file to clipboard.

## Usage

```
/copy-selection <file> <start>:<end>    # Line range, e.g. /copy-selection main.py 10:25
/copy-selection <file> <pattern>        # Lines matching pattern
```

## Instructions

Parse `$ARGUMENTS` to extract file path and range/pattern.

**Line range format (`N:M`):**
```bash
FILE="$1"
RANGE="$2"
START="${RANGE%%:*}"
END="${RANGE##*:}"
sed -n "${START},${END}p" "$FILE" | bash ~/.claude/plugins/clipboard/scripts/clipboard.sh copy
echo "Copied lines $START-$END from $FILE"
```

**Pattern format:**
```bash
FILE="$1"
PATTERN="$2"
grep "$PATTERN" "$FILE" | bash ~/.claude/plugins/clipboard/scripts/clipboard.sh copy
echo "Copied lines matching '$PATTERN' from $FILE"
```
