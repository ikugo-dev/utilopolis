#!/bin/bash

PRIMARY="eDP-1"
SECONDARY="HDMI-1"

MONITOR_STATE="$("$(dirname "$0")/../detect-monitor.sh")"

if [[ $MONITOR_STATE == "SECONDARY" ||
        $MONITOR_STATE == "BOTH" ]]; then # -> PRIMARY
    xrandr --output "$PRIMARY" --auto \
           --output "$SECONDARY" --off

elif [[ $MONITOR_STATE == "PRIMARY" ||
        $MONITOR_STATE == "NONE" ]]; then # -> SECONDARY
    xrandr --output "$PRIMARY" --off \
           --output "$SECONDARY" --auto
fi

i3-msg restart
