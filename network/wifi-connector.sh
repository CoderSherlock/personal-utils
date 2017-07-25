#!/bin/bash

function check_nw_ping {
	ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error
}

function check_wlnw_ifx {
	ifxs=($(ls /sys/class/net))
	# echo ${ifxs[*]}
	return ${ifxs[*]}
}

function check_wlnw_ifx_2 {
	ifxs=()
	for i in /sys/class/net/*; do
		ifxs+=($(basename $i))
	done
	# echo ${ifxs[*]}
	return ${ifxs[*]}
}

# if [ "`check_nw_ping`" = "ok" ]; then
#     echo "yah"
# fi

loop=$(check_wlnw_ifx)
for i in $loop; do
	echo $i
done
