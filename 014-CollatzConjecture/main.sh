#!/bin/bash

if ! [ "$1" -eq "$1" ] 2>/dev/null; then
    echo "Please use a valid number." ; exit 1
else 
    INPUT=$1
fi;

COUNT=1

if ((INPUT <= 0)) ; then
    echo "Please use a number greater than 0."
fi;

while ((INPUT != 1)) ; do
    echo $INPUT
    if ! (( INPUT % 2 )) ; then
        INPUT=$(( INPUT / 2 ))
    else
        INPUT=$(( INPUT * 3 + 1 ))
    fi;
    ((COUNT++))
done;

echo "1";
echo "Total Steps: $COUNT"
