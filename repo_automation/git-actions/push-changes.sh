#!/usr/bin/env bash
set -e

# choď do rootu repozitára (python-checkin)
cd "$(git rev-parse --show-toplevel)"

# bezpečnosť: over, že si na branche script
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [ "$BRANCH" != "script" ]; then
  echo "ERROR: Si na branche '$BRANCH'. Prejdi na 'script' cez: git checkout script"
  exit 1
fi

# pridaj celý folder so skriptami aj zmeny.txt
git add repo_automation/git-actions

# ak nie sú zmeny, tak neskonči chybou
if git diff --cached --quiet; then
  echo "INFO: Žiadne zmeny na commit."
  exit 0
fi

git commit -m "Auto update git-actions - $(date)"
git push origin script

echo "OK: commit + push hotový (origin/script)"

