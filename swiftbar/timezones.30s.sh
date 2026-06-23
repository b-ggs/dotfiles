#!/usr/bin/env bash

current_offset="$(date +"%z")"
manila_offset="$(TZ="Asia/Manila" date +"%z")"
if [ "$current_offset" != "$manila_offset" ]; then
  echo -n "MNL " ; TZ="Asia/Manila" date +'%a %-l:%M %p'
else
  echo -n "VNO " ; TZ="Europe/Vilnius" date +'%a %-l:%M %p'
fi

echo "---"

echo -n "MNL " ; TZ="Asia/Manila" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "VNO " ; TZ="Europe/Vilnius" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "LAX " ; TZ="America/Los_Angeles" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "JFK "; TZ="America/New_York" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "UTC " ; TZ="UTC" date +'%a %Y-%m-%d %-l:%M %p'
