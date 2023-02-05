#!/bin/sh
 
echo "%{F#F90C0C} rpi0: %{F#ffffff}$(/usr/sbin/ifconfig rpi0 | grep "inet " | awk '{print $2}')%{u-}"