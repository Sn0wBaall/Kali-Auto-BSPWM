#!/bin/sh
  
 IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
  
 if [ "$IFACE" = "tun0" ]; then
     echo "%{F#1bbF3e}%{u#66BB6A}%{+u}󰆧%{+u}%{F#ffffff} $(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
 else
      echo "%{F#1bbF3e}%{u#66BB6A}%{+u}󰆧%{+u}%{F#ffffff} Disconnected%{-u}"

 fi

