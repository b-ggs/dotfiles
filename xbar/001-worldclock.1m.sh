#!/bin/bash

# Display UTC in the menubar, and one or more additional zones in the drop down.
# The current format (HH:MM:SS) works best with a one second refresh, or alter
# the format and refresh rate to taste.
#
# <xbar.title>World Clock</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Adam Snodgrass</xbar.author>
# <xbar.author.github>asnodgrass</xbar.author.github>
# <xbar.desc>Display current UTC time in the menu bar, with various timezones in the drop-down menu</xbar.desc>
# <xbar.image>https://cloud.githubusercontent.com/assets/6187908/12207887/464ff8b2-b617-11e5-9d61-787eed228552.png</xbar.image>

MENUBAR_ZONE="Europe/London"
MENUBAR_ZONE_LABEL="LON"
ZONES="Europe/London America/Los_Angeles Europe/Vilnius"

TZ=$MENUBAR_ZONE date +"%-l:%M %p $MENUBAR_ZONE_LABEL"
echo '---'
for zone in $ZONES; do
  echo "$(TZ=$zone date +'%a %b %e %-l:%M %p %z') $zone"
done
