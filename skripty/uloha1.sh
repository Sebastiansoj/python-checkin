#!/usr/bin/env bash

read -p "Daj otazku :" otazka && read -p "Odpoved :" odpoved
s="$otazka : $odpoved"
echo "$s"
echo ${#s}



