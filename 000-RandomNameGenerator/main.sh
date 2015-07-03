#!/bin/bash

#Created by Colin S. for the DPT Challenge
#Random Name Generator

set -e

GENDER='a'
OPTIND=1
RANDVAL=1
verbose=0

#Treat arguments
while getopts "g:v:" opt; do
    case "$opt" in
    v)          verbose=1
                ;;
    g)          GENDER="$OPTARG"
                ;;
    \?)         echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
    *)          echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
    esac
done


#Determine gender based on arguments
case $GENDER in
    f|female)   FIRSTNAMEFILE='dist.female.first'
                ;;
    m|male)     FIRSTNAMEFILE='dist.male.first'
                ;;
    a|fm|mf)    FIRSTNAMEFILE='dist.all.first'
                ;;
    \?)         echo "Invalid parameter value: -$GENDER" >&2
                exit 1
                ;;
    *)          echo "Invalid parameter value: -$GENDER" >&2
                exit 1
                ;;
esac

#Create random numbers n to select the nth name in the list.
RANDVAL=$( cat $FIRSTNAMEFILE | wc -l )
FIRSTNAMENUM=$( shuf -i 0-$RANDVAL -n 1 );
LASTNAMENUM=$( shuf -i 0-88799 -n 1 );

#Select names from list
FIRSTNAMETEXT=$( cat $FIRSTNAMEFILE | sed -n "${FIRSTNAMENUM}p" | awk '{print $1}' );
LASTNAMETEXT=$( cat dist.all.last | sed -n "${LASTNAMENUM}p" | awk '{print $1}' );

echo $FIRSTNAMETEXT $LASTNAMETEXT
