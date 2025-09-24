#!/bin/bash

## Define a reliable host to ping
#HOST="google.com"
#
## Ping the host with a single packet and a short timeout
## The -c 1 sends one packet, -W 2 sets a 2-second timeout for the response
## The -q suppresses most output
#ping -c 1 -W 2 "$HOST" &>/dev/null
#
## Check the exit status of the ping command
#if [ $? -eq 0 ]; then
#    # echo "Online: Internet connection is available."
#else
#    # echo "Offline: No internet connection."
#    # reboot
#    sudo systemctl --no-wall reboot
#fi

SERVER=192.168.0.1

LOG_FILE="$HOME/custom_logs/internet_check.log"

if ping -c 5 $SERVER >/dev/null 2>&1; then
    echo "[$(date)] server is up $TIMESTAMP" >>"$LOG_FILE"
    echo "server up"
    exit 0
else
    echo "[$(date)] server is down $TIMESTAMP" >>"$LOG_FILE"
    sudo systemctl reboot
fi
