#!/usr/bin/env bash


while true; do
  clear
  echo "=== MENU ==="
  echo "1 - vypíš meno a aktuálnu cestu používateľa"
  echo "2 - vypíš IPv4 IP adresy"
  echo "3 - vypíš názov a verziu linuxovej distribúcie"
  echo "4 - vykonaj príkaz (zadaj príkaz a ten sa spustí)"
  echo "5 - exit"
  echo
  read -rp "Zadaj voľbu: " volba

  case "$volba" in
    1)
      echo
      echo "Meno používateľa: $(whoami)"
      echo "Aktuálna cesta: $(pwd)"
      ;;

    2)
      echo
      echo "IPv4 adresy (rozhrania):"
      ip -4 -o addr show scope global | awk '{split($4,a,"/"); print $2": "a[1]}' || echo "Nie je dostupný príkaz ip"
      ;;

    3)
      echo
      if [ -r /etc/os-release ]; then
        . /etc/os-release
        echo "Distribúcia: $NAME"
        echo "Verzia: $VERSION"
      else
        echo "Nepodarilo sa nájsť /etc/os-release, vypisujem uname:" 
        uname -srm
      fi
      ;;

    4)
      echo
      read -rp "Zadaj príkaz, ktorý chceš spustiť: " prikaz
      if [ -n "$prikaz" ]; then
        echo
        echo "----- Výstup príkazu: $prikaz -----"
        bash -c "$prikaz"
        echo "----- Koniec výstupu -----"
      else
        echo "Nebolo zadané nič."
      fi
      ;;

    5)
      echo "Koniec."
      exit 0
      ;;

    *)
      echo "Neplatná voľba. Skús znova."
      ;;
  esac

  echo
  read -rp "Stlač Enter pre pokračovanie..." _
done

