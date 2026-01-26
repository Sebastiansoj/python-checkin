#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

"$DIR/make-changes.sh"
"$DIR/push-changes.sh"
"$DIR/fetch-changes.sh"

echo "OK: všetky skripty prebehli"

