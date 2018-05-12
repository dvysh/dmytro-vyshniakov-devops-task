#!/bin/sh

TIME=$1
MTR=$2

if [ -z ${TIME} ]; then TIME=5; fi
if [ -z ${MTR} ]; then MTR="all"; fi

while true; do
    ./metrics ${MTR}
    sleep ${TIME}
done
