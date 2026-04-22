---
description: Copy a URL to clipboard. Pass URL as argument, or auto-detect URLs in provided text.
allowed-tools: [Bash]
---

# /copy-url

Copy a URL to clipboard.

## Usage

```
/copy-url https://example.com           # Copy specific URL
/copy-url "text with https://url.com"   # Extract and copy first URL found
```

## Instructions

Parse `$ARGUMENTS`:
1. If argument starts with `http://` or `https://` → copy directly
2. Otherwise → extract first URL found with grep and copy that

```bash
ARG="$ARGUMENTS"
if echo "$ARG" | grep -qE '^https?://'; then
  URL="$ARG"
else
  URL=$(echo "$ARG" | grep -oE 'https?://[^ ]+' | head -1)
fi

if [ -z "$URL" ]; then
  echo "No URL found in: $ARG"
  exit 1
fi

bash ~/.claude/plugins/clipboard/scripts/clipboard.sh copy "$URL"
echo "Copied URL: $URL"
```
