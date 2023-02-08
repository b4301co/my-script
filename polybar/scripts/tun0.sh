#!/bin/sh
 
echo "%{F#F90C0C}󰖂 tun0:%{F#ffffff}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-} || echo 'Not online'"

#echo "%{F#2495e7} tun0: %{F#ffffff}$([  -d /sys/class/net/tun0 ] && /sbin/ifconfig tun0|grep inet|head -1|sed 's/\:/ /'|awk '{print $2}') || echo "Not online"
