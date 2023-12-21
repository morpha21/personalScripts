#!/bin/bash


phone="98:1E:89:30:30:3D"

state=$(systemctl status bluetooth.service | grep active | awk '{print$2}')

if [ $state == "inactive" ]
then
	rfkill block bluetooth
	rfkill unblock bluetooth
        sudo systemctl start bluetooth.service && sleep 0.43
        bluetoothctl trust $phone
        bluetoothctl pair $phone
        bluetoothctl connect $phone
	sink=$(pacmd list-sinks | grep index | tail -1)
        pacmd set-default-sink $sink
elif [ $state == "active" ]
then
        systemctl stop bluetooth*
        killall bluetoothd
fi

