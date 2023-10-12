#!/bin/sh -u

WAN=eth0
DNS=8.8.8.8
REMOTE=google.com

set -x

uname -a
date
uptime
free -m
ip neigh
ip addr
ifconfig
ethtool -i $WAN
nslookup $REMOTE      ||   echo Error: exit code: $?
nslookup $REMOTE $DNS ||   echo Error: exit code: $?
ping -c1 -W1 $DNS     || { echo Error: exit code: $?; traceroute -w1 $DNS; }
ping -c1 -W1 $REMOTE  || { echo Error: exit code: $?; traceroute -w1 $REMOTE; }
