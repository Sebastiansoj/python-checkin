#!/usr/bin/env bash

set -e

#ensure git command is present
#command -v git || exit 0
#command -v git > /dev/null 2>&1 || exit 0

#fetch file content from git server (script.sh from script branch)

#option 1 curl <url> | bash
curl 'https://raw.githubusercontent.com/Sebastiansoj/python-checkin/refs/heads/script/script.sh' | bash

#option 2 - store to variable/file and execute


which git > /dev/null 2> /dev/null || {
  echo "command git not present, exitting..."
  exit 0
}

tmpdir="$(mktemp -d tmpdir.XXXXXXXX)"
cd "$tmpdir"
git clone 'git@github.com:Sebastiansoj/python-checkin.git' myrepodir
cd myrepodir

git branch -a
git checkout script
ls -la
pwd
#clone git repo, switch to branch script and run the script
./script.sh


echo "end of bash script."
echo "executing python.py"

command -v python3 || {
  echo "command python3 not found, exitting..."
  exit 0
}

./python.py

