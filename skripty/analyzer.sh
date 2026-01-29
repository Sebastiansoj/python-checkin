#!/bin/bash
set -eu

# -----------------------------
# Kontrola debug módu
# -----------------------------
for arg in "$@"; do
    if [[ "$arg" == "--debug" ]]; then
        set -x
    fi
done

# -----------------------------
# Kontrola argumentov
# -----------------------------
if [[ $# -lt 2 ]]; then
    echo "Chyba: Musíte zadať súbor a typ (--type=log alebo --type=csv)"
    exit 2
fi

FILE="$1"
TYPE="$2"

# -----------------------------
# Kontrola existencie súboru
# -----------------------------
if [[ ! -f "$FILE" ]]; then
    echo "Chyba: Súbor $FILE neexistuje"
    exit 2
fi

# -----------------------------
# Rozhodnutie podľa typu súboru
# -----------------------------
case "$TYPE" in
    --type=log)
        echo "Skript: $0"
        echo "Súbor: $FILE"

        # Počet riadkov
        LINE_COUNT=$(wc -l < "$FILE")
        echo "Počet riadkov: $LINE_COUNT"

        # Počet ERROR, WARNING, INFO
        ERR_COUNT=$(grep -c "ERROR" "$FILE" || true)
        WARN_COUNT=$(grep -c "WARNING" "$FILE" || true)
        INFO_COUNT=$(grep -c "INFO" "$FILE" || true)
        echo "ERROR: $ERR_COUNT"
        echo "WARNING: $WARN_COUNT"
        echo "INFO: $INFO_COUNT"

        # Výpis prvých a posledných 5 riadkov
        echo "Prvých 5 riadkov:"
        head -n 5 "$FILE"
        echo "Posledných 5 riadkov:"
        tail -n 5 "$FILE"

        # Chyby nájdené?
        if [[ $ERR_COUNT -gt 0 ]]; then
            echo "Chyby nájdené"
        else
            echo "Bez chýb"
        fi

        # Uloženie do log_report.txt
        {
            echo "Skript: $0"
            echo "Súbor: $FILE"
            echo "Počet riadkov: $LINE_COUNT"
            echo "ERROR: $ERR_COUNT"
            echo "WARNING: $WARN_COUNT"
            echo "INFO: $INFO_COUNT"
            if [[ $ERR_COUNT -gt 0 ]]; then
                echo "Chyby nájdené"
            else
                echo "Bez chýb"
            fi
        } > log_report.txt

        echo "Výsledok uložený do log_report.txt"
        ;;

    --type=csv)
        echo "Skript: $0"
        echo "Súbor: $FILE"

        # Odstránenie prázdnych riadkov
        sed '/^\s*$/d' "$FILE" > csv_clean.txt

        # Počet riadkov
        LINE_COUNT=$(wc -l < csv_clean.txt)
        echo "Počet záznamov: $LINE_COUNT"

        # Extrahovanie tretieho stĺpca a výpočet priemeru číselných hodnôt
        SUM=0
        COUNT=0
        while IFS=',' read -r col1 col2 col3; do
            if [[ "$col3" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
                SUM=$((SUM + col3))
                COUNT=$((COUNT + 1))
            fi
        done < <(tail -n +2 csv_clean.txt)  # vynecháme hlavičku

        if [[ $COUNT -gt 0 ]]; then
            AVG=$(echo "scale=2; $SUM / $COUNT" | bc)
        else
            AVG=0
        fi

        echo "Priemerná hodnota v treťom stĺpci: $AVG"

        # Uloženie do csv_report.txt
        {
            echo "Skript: $0"
            echo "Súbor: $FILE"
            echo "Počet záznamov: $LINE_COUNT"
            echo "Priemerná hodnota v treťom stĺpci: $AVG"
        } > csv_report.txt

        echo "Spracovaný a uložený do csv_report.txt"
        ;;

    *)
        echo "Chyba: Neznámy typ súboru. Použite --type=log alebo --type=csv"
        exit 1
        ;;
esac

exit 0

