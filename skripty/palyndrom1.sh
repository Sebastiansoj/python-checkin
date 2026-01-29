#!/usr/bin/env bash
  2
  3 # vytvorim kopiu slova, otocim ju a porovnam
  4
  5 #input 2 sposoby
  6 #1. sposob (pochopitelnejsi)
  7 read -p "zadaj slovo " slovo
  8
  9 #2. sposob (menej CPU)
10 #slovo="$1"
11
12 #obratene slovo v novej premennej
13 obratene_slovo=$(echo "$slovo" | rev)
14
15 if [ "$slovo" == "$obratene_slovo" ]
16 then
17    echo "slovo $slovo je palindróm"
18 else
19    echo "slovo $slovo  nie je palindróm"
20 fi
