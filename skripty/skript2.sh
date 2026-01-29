#!/usr/bin/env bash
#set -x #debugging mode
#set -e #exit on error
#set -u #exit on undefined variable


echo $(( 5 + 5 ))
echo $(( $RANDOM ))
echo $(( $RANDOM % 5 ))
echo $(( ($RANDOM % 5) + 1 ))

meno="$1"

if [ "$meno" == "Peter" ]; then  # niekedy treba dat dvojite zatvorky -- [[ podmienka ]]
    # commands if true
    echo "Meno je Peter"
elif [ "$meno" == "Jano"]; then
    echo "Meno je Jano"
else
    # commands if false
    echo "Meno nie je Peter ani Jano"
fi





#dropdown with checking


var="orange banana apple"

case $var in
    *orange*)
        echo "Matched orange"
        ;;&
    *banana*)
        echo "Matched banana"
        ;;&
    *pepper*)
        echo "Matched pepper"
        ;;
esac



items="apple banana cherry"


for item in $items; do
    echo "Fruit: $item"
done


for i in {1..5}; do
    echo "Number: $i"
done


for ((i=1; i<=5; i++)); do
    echo "Counter: $i"
done



for i in {1..5}; do
    if [ $i -eq 3 ]; then
        echo "Skipping 3"
        continue  # skip this iteration
    fi

    if [ $i -eq 5 ]; then
        echo "Stopping at 5"
        break  # exit the loop
    fi

    echo "Number: $i"
done

