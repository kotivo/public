#!/bin/bash

api_url=""
ctrl_id=""
macs=""
auth=""
timeout="10"

if [[ $EUID -ne 0 ]]; then
    echo "this script must be run as root"
    exit 1
fi

if [ -f "/etc/kotivo/away-detector.conf" ]; then
	source "/etc/kotivo/away-detector.conf"
else
	echo "configuration /etc/kotivo/away-detector.conf missing"
	exit 1
fi

t_away="home"
while true; do
    home="0"
    for mac in $macs; do
        arp-scan -q -N -l|grep "$mac" > /dev/null
    	if [ "$?" == "0" ]; then
    		home="1"
    	fi
    done

    if [ "$home" == "1" ]; then
        curl -s -u "$auth" "$api_url/controllers/$ctrl_id/profiles/away/"|grep '"away":false' > /dev/null
        if [ "$?" != "0" ]; then
        	curl -s -u "$auth" "$api_url/controllers/$ctrl_id/profiles/away/" -X "PUT" -d '{"away":false}' > /dev/null
            echo "Home"
        fi
        t_away="home"
    else
        now=`date +%s`
        if [ "$t_away" == "home" ]; then
            t_away=$((timeout*60+now))
            echo "Will be away $t_away / $now"
        fi
        if [ "$t_away" != "away" ] && [ "$now" -gt "$t_away" ]; then
    		curl -s -u "$auth" "$api_url/controllers/$ctrl_id/profiles/away/" -X "PUT" -d '{"away":true}' > /dev/null
            t_away="away"
            echo "Away"
        fi
    fi

    # wait for next poll
    sleep 10
done
