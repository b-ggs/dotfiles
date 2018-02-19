#!/bin/bash

# Forked from
# https://github.com/japorized/dotfiles/blob/master/dotfiles/config/%C3%9Cbersicht/widgets/scripts/wifi_status_script

services=$(networksetup -listnetworkserviceorder | grep 'Hardware Port')

while read line; do
    sname=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $2}')
    sdev=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $4}')
    # echo "Current service: $sname, $sdev, $currentservice"
    if [ -n "$sdev" ]; then
        ifconfig $sdev 2>/dev/null | grep 'status: active' > /dev/null 2>&1
        rc="$?"
        if [ "$rc" -eq 0 ]; then
            currentservice="$sname"
            break
        fi
    fi
done <<< "$(echo "$services")"

if [ -n "$currentservice" ] ; then
    echo "$currentservice@$(networksetup -getairportnetwork en0 | cut -c 24-)@$(networksetup -getinfo "Apple USB Ethernet Adapter" | grep "IP address" | grep "\." | cut -c 13-)"
else
    >&1 echo "none@none@"
    exit 1
fi
