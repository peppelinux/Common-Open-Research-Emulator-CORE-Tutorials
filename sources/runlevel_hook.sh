#!/bin/sh
# session hook script; write commands here to execute on the host at the
# specified state

BRIFNAME=$(ifconfig | grep  "^b.[0-9]\{4\}.[a-z0-9]*"| awk -F' ' {'print $1'})
WANIFNAME='wlp2s0'
ifconfig $BRIFNAME 10.0.0.254/24
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.0.0.1 -o $WANIFNAME -j MASQUERADE
