#!/bin/sh
IN=$(nslookup $1 | tail -n 2)

List=$(echo $IN | tr ":" "\n")

arr=($List)
echo ${arr[1]}