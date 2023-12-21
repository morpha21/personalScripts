#!/bin/bash

state=$(systemctl status bluetooth.service | grep Active | awk '{print$2}')

if [ $state == "inactive" ]
then
	rfkill unblock bluetooth &&
        sudo systemctl start bluetooth.service && sleep 0.43
	bluetoothctl --timeout 1 scan on
        device="$(bluetoothctl devices | awk '{for(i=3; i<=NF;i++) printf $i" "; print""}' | dmenu -l 28 -p "select bluetooth device: ")"
        device="$(bluetoothctl devices | grep "$(echo $device)" | awk '{print$2}')"
        bluetoothctl trust $device &&
        bluetoothctl pair $device &&
        bluetoothctl connect $device &&
	sleep 0.43
	dev=$(pactl list short sinks | grep blue | cut -f 1)
	dunstify "bluetooth:"  "<span font='11'>󰂱</span> $device"
	sleep 6
	pactl set-sink-volume $dev 6%
elif [ $state == "active" ]
then
	devices=$(bluetoothctl devices Connected)
	for dev in $devices
	do
		bluetoothctl disconnect $dev &&
		bluetoothctl untrust $dev
	done
        sudo killall bluetoothd &&
        systemctl stop bluetooth* &&
	rfkill block bluetooth
	dunstify "bluetooth:"  "<span font ='11'>󰂲</span> turned off"
elif [ $state == "failed" ]
then
        sudo systemctl stop bluetooth.service
        sudo systemctl start bluetooth.service
	rfkill block bluetooth
	rfkill unblock bluetooth
fi
