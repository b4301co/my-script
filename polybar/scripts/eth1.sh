#!/bin/sh

IFACE=$(/usr/sbin/ifconfig | grep eth1 | awk '{print $1}' | tr -d ':')

if [ "$IFACE" = "eth1" ]; then
    echo "%{F#2495e7} %{F#ffffff}$(/usr/sbin/ifconfig eth1 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{F#2495e7}%{u-} Disconnected"
fi
