---
description: Copy the last Claude response/output to clipboard.
allowed-tools: [Bash]
---

# /copy-last

Copy the last Claude response to clipboard.

## Instructions

1. Retrieve the last assistant message from the current conversation.
2. Copy it to clipboard:

```bash
bash ~/.claude/plugins/clipboard/scripts/clipboard.sh copy "$LAST_RESPONSE"
```

If no previous response exists in this session, inform the user: "No previous response found in this session."
