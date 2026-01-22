#!/usr/bin/env bash

#ensure git command is present
#which git > /dev/null 2>&1 || exit 0

#fetch file content from git server (script.sh from script branch)
#option 1 curl <url> | bash
curl 'https://raw.githubusercontent.com/slabydenis/python-checkin/refs/heads/script/script.sh'

#option 2 - store to variable/file and execute

which git > /dev/null 2> /dev/null || {
        echo "command git not present, exitting"
        exit
}

#clone git repo. switch to branch script and run the script
tmpdir="$(mktemp -d tmpdir.XXXXXX)"
cd "$tmpdir"
git clone 'git@github.com:slabydenis/python-checkin.git' myrepodir
cd myrepodir

git branch -a
git checkout script
#and run the script locally from repo
ls -la
pwd
./script.sh

echo "End of bash script"
echo "executing Python.py"
command -v python3 > /dev/null 2>&1 || {
        echo "command python3 not found, exitting..."
        exit 0
}

./python.py
 
