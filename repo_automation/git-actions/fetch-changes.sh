#!/usr/bin/env bash
set -e

cd "$(git rev-parse --show-toplevel)"

git fetch origin
git pull origin script

echo "OK: fetch + pull hotové"

