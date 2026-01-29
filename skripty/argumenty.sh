#!/usr/bin/env bash

#echo "$0"

echo "\$*"

echo "$*"
for argument in "$*" ;do
  echo "$argument"
done

echo "\$@"

echo "$@"

for argument in "$@" ;do
  echo "$argument"
done

echo "shift"

debug='false'

while [ -n "$*" ]
do
  echo "$1"

  case "$1" in
	--host=*)
	   host="$1"
	   host="${1:7}"
	   shift
	   ;;
	--debug)
	   debug='true'
	   shift
	   ;;
	--help)
	   echo "$0 help"
	   echo "supported arguments:"
	   echo "--host --debug --help"
	   exit 0
	   ;;
	*)
	   # default case
	   echo "unknowd argument $1"
           echo "see $0 --help"
	   shift
	   ;;
  esac

done

if [ -z "$host"]
then
  echo "Host not specified."
  echo "--host argument is mandatory"
  echo "See $0 --help"
  echo "Exitting..."
  exit 0
fi

echo "Your host is $host and debug is $debug"
