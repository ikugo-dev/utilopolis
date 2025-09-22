#!/bin/bash
MONITOR_STATE=$(dirname "$0" + ../detect-monitor.sh)
if [[ $MONITOR_STATE == "SECONDARY" || $MONITOR_STATE == "NONE" ]]; then
    BRIGHTNESS_VALUE=0
else
    BRIGHTNESS_VALUE=$(brightnessctl | grep -o "(.*" | tr -d "()")
fi
~/Code/Scripts/polybar/display-brightness.sh "${BRIGHTNESS_VALUE//%/}"
