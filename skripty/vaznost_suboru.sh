#!/usr/bin/env bash

echo "------ seriozna funkcia ------"

function vaznost_suboru() {
  local skore_vaznosti=0
  local nazov_suboru="$1"
  local obsah_suboru="$(cat "$nazov_suboru")"
  echo "$obsah_suboru" | grep -i -e internal -e confidental >/dev/null 2>/dev/null && {
  skore_vaznosti=$(( $skore_vaznosti + 2 ))
}
  local pocet_riadkov_suboru="$(echo "$obsah_suboru" | wc -l)"
  skore_vaznosti=$(( $skore_vaznosti + ($pocet_riadkov_suboru / 10 )))
  echo "subor: $nazov_suboru"
  echo "vaznost: $skore_vaznosti"
}


echo "spustam vaznost suboru s prvym argumentom skriptu"
vaznost_suboru "$1"
