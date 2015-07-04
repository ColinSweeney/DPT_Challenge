#!/bin/bash

INPUT=0
FAHRVAL=0
CELVAL=""
KELVAL=0

#Deal with arguments
while getopts ":" opt; do
    case "$opt" in
    f)          FAHRVAL="$OPTARG"
                ;;
    c)          CELVAL="$OPTARG"
                ;;
    k)          KELVAL="$OPTARG"
                ;;
    \?)         echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
    *)          echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
    esac
done


function testfunc {
    echo "Hello $1"
}

testfunc Colin



function convert {
    INFORMAT=$1
    INTEMP=$2
    case $INTEMP in
        f)    CELVAL=echo "$(echo "scale = 5; $( echo "( $INTEMP - 32 )" | bc ) * ( 5 / 9 )" | bc)"
              ;;
    esac
}

convert f 0
echo $CELVAL
