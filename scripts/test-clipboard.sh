#!/bin/bash
# Smoke test for clipboard.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLIPBOARD="$SCRIPT_DIR/clipboard.sh"

echo "--- clipboard.sh smoke test ---"

# Test 1: detect platform
PLATFORM=$(bash "$CLIPBOARD" detect)
echo "[1] Platform detected: $PLATFORM"
[ -n "$PLATFORM" ] || { echo "FAIL: empty platform"; exit 1; }

# Test 2: copy
bash "$CLIPBOARD" copy "test-string-123"
echo "[2] copy: OK"

# Test 3: paste
PASTED=$(bash "$CLIPBOARD" paste)
[ "$PASTED" = "test-string-123" ] || { echo "FAIL: paste returned '$PASTED', expected 'test-string-123'"; exit 1; }
echo "[3] paste: OK (got: $PASTED)"

# Test 4: clear
bash "$CLIPBOARD" clear
echo "[4] clear: OK"

echo "--- All tests passed ---"
