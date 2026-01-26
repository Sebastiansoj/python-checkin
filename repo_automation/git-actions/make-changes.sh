#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_FILE="$SCRIPT_DIR/zmeny.txt"

NOW="$(date)"
RAND_NUM="$RANDOM"

echo "Zmena vygenerovaná: $NOW" > "$TARGET_FILE"
echo "Random číslo: $RAND_NUM" >> "$TARGET_FILE"

echo "OK: vytvorený/aktualizovaný $TARGET_FILE"

