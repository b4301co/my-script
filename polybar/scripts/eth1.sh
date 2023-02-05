#!/bin/sh
 
echo "%{F#2495e7} eth1: %{F#ffffff}$(/usr/sbin/ifconfig eth1 | grep "inet " | awk '{print $2}')%{u-}"