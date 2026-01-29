#!/usr/bin/env bash
#set -x

mypath="$(realpath "$0")"
mydir="(dirname "$mypath")"
echo "$mypath"
echo "$mydir"
cd "$mydir"

if [ -n "$1"] 

text=$1

echo "$text" | sed 's/ //g'
echo


