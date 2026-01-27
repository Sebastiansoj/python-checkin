#!/usr/bin/env bash

clear
echo "spustil si skript $0"
echo #ciste echo, je ako enter, cize prazdny riadok

rozsah=100

hadane_cislo="$((($RANDOM % $rozsah) + 1 ))"

pocet_pokusov=5

while [ $pocet_pokusov -gt 0 ]
do
  read -p "Zadaj cislo: " zadane_cislo
  pocet_pokusov=$(( pocet_pokusov - 1 ))
  if [ $zadane_cislo -eq $hadane_cislo ]
  then
    echo "Vyhral si"
    echo "hadane cislo bolo $hadane_cislo"
    break
  elif [ $zadane_cislo -gt $hadane_cislo ]
  then
    echo "hadane cislo je mensie."
  elif [ $zadane_cislo -lt $hadane_cislo ]
  then
    echo "hadane cislo je vacsie"
  fi
done


test "$pocet_pokusov" -gt 0 || {
  echo "Prehral si, hadane cislo bolo $hadane_cislo"
}
