#!/usr/bin/env bash

echo -n "VNO " ; TZ="Europe/Vilnius" date +'%a %-l:%M %p'

echo "---"

echo -n "MNL " ; TZ="Asia/Manila" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "VNO " ; TZ="Europe/Vilnius" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "LAX " ; TZ="America/Los_Angeles" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "JFK "; TZ="America/New_York" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "UTC " ; TZ="UTC" date +'%a %Y-%m-%d %-l:%M %p'
