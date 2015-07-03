#!/bin/bash

INPUT="$1"
COUNT=1

while ((COUNT <= INPUT)) ; do
    (!((COUNT%15)) && echo 'FizzBuzz') ||
    (!((COUNT%5)) && echo 'Buzz') ||
    (!((COUNT%3)) && echo 'Fizz') ||
    echo $COUNT;
    ((COUNT++))
done;
