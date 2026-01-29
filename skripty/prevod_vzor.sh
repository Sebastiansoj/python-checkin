#!/bin/bash

# Nacitanie vstupu
read -p "Zadaj cele kladne cislo: " number

# Kontrola vstupu
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Chyba: Zadaj celé kladné číslo."
    exit 1
fi

# Funkcia na prevod do binárnej sústavy
to_binary() {
    local n=$1
    local result=""

    if [ "$n" -eq 0 ]; then
        echo "0"
        return
    fi

    while [ "$n" -gt 0 ]; do
        result=$(( n % 2 ))$result
        n=$(( n / 2 ))
    done

    echo "$result"
}

# Funkcia na prevod do hexadecimálnej sústavy
to_hex() {
    local n=$1
    local result=""
    local remainder

    if [ "$n" -eq 0 ]; then
        echo "0"
        return
    fi

    while [ "$n" -gt 0 ]; do
        remainder=$(( n % 16 ))

        case $remainder in
            10) digit="A" ;;
            11) digit="B" ;;
            12) digit="C" ;;
            13) digit="D" ;;
            14) digit="E" ;;
            15) digit="F" ;;
            *)  digit="$remainder" ;;
        esac

        result="$digit$result"
        n=$(( n / 16 ))
    done

    echo "$result"
}

# Výstup
echo "Binarna sustava: $(to_binary "$number")"
echo "Hexadecimálna sústava: $(to_hex "$number")"

