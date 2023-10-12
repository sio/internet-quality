#!/bin/sh -u

WORKDIR=$(dirname "$0")
while true
do
    timeout 150 "$WORKDIR/query.sh" >>"$WORKDIR/log" 2>&1
    sleep 23
done
