#!/bin/bash

NUMINPUT="15"
COUNT=1
FIZZINPUT="Fizz"
BUZZINPUT="Buzz"

#Treat arguments
while getopts "f:b:n:" opt; do
    case "$opt" in
    f)          FIZZINPUT="$OPTARG"
                ;;
    b)          BUZZINPUT="$OPTARG"
                ;;
    n)          NUMINPUT=$OPTARG
                ;;
    \?)         echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
    *)          echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
    esac
done

shift $((OPTIND - 1))

while ((COUNT <= NUMINPUT)) ; do
    (!((COUNT%15)) && echo "$FIZZINPUT$BUZZINPUT") ||
    (!((COUNT%5)) && echo "$BUZZINPUT") ||
    (!((COUNT%3)) && echo "$FIZZINPUT") ||
    echo $COUNT;
    ((COUNT++))
done;
