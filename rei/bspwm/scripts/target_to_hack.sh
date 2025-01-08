#!/bin/bash

user=$(whoami)

ip_address=$(/bin/cat /home/$user/.config/bin/target | awk '{print $1}')
machine_name=$(/bin/cat /home/$user/.config/bin/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
  echo "%{F#e53935}%{u#EF5350}%{+u}󰓾%{+u}%{F#FFFFFF} $ip_address - $machine_name%{-u}"
else
    echo "%{F#e53935}%{u#EF5350}%{+u}󰓾%{+u}%{F#ffffff} No target%{-u}"
fi

