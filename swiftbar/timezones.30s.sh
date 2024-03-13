#!/usr/bin/env bash

echo -n "VNO " ; TZ="Europe/Vilnius" date +'%a %-l:%M %p'

echo "---"

echo -n "VNO " ; TZ="Europe/Vilnius" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "LAX " ; TZ="America/Los_Angeles" date +'%a %Y-%m-%d %-l:%M %p'
echo -n "DEN " ; TZ="America/Denver" date +'%a %Y-%m-%d %-l:%M %p'
