#!/bin/bash

function check_nw_ping {
	ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error
}


declare -ga ifxs							# declare nw interfaces as global
function check_wlnw_ifx {					# Get nw interfaces by looking /sys/class/net, default
	ifxs=($(ls /sys/class/net))
	# echo ${ifxs[*]}
}

function check_wlnw_ifx_2 {					# Get nw interfaces by file scan
	ifxs=()
	for i in /sys/class/net/*; do
		ifxs+=($(basename $i))
	done
	# echo ${ifxs[*]}
}

function connect_to {
	ssid=$1
	password=$2
	nwtype=$3
	if [ $nwtype = 'wep' ]; then
		echo wep
	else
		if [ $nwtype = 'wpa' ]; then
			echo wpa
		fi
	fi
}


check_wlnw_ifx
for i in ${ifxs[*]}; do
	echo $i
done


connect_to 
