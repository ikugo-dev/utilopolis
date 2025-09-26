#!/bin/bash
MONITOR_STATE="$("$(dirname "$0")/../detect-monitor.sh")"
HDMI_CONNECTED=$(xrandr | grep "^HDMI-A-0 connected")

if [[ $MONITOR_STATE == "SECONDARY" ]]; then # -> PRIMARY
    xrandr --output eDP --auto --set TearFree on
    [[ -n $HDMI_CONNECTED ]] && xrandr --output HDMI-A-0 --off

elif [[ $MONITOR_STATE == "PRIMARY" ||
        $MONITOR_STATE == "BOTH" ||
        $MONITOR_STATE == "NONE" ]]; then # -> SECONDARY
    [[ -n $HDMI_CONNECTED ]] && \
      xrandr --output HDMI-A-0 --auto --set TearFree on
    xrandr --output eDP --off
fi

# if [[ $MONITOR_STATE == "SECONDARY" ]]; then # -> PRIMARY
#     xrandr --output eDP --auto --set TearFree on
#     [[ -n $HDMI_CONNECTED ]] && xrandr --output HDMI-A-0 --off
#
# elif [[ $MONITOR_STATE == "PRIMARY" ]]; then # -> BOTH
#     xrandr --output eDP --auto --set TearFree on
#     [[ -n $HDMI_CONNECTED ]] && \
#       xrandr --output HDMI-A-0 --auto --primary --right-of eDP --set TearFree on
#
# elif [[ $MONITOR_STATE == "BOTH" || $MONITOR_STATE == "NONE" ]]; then # -> SECONDARY
#     [[ -n $HDMI_CONNECTED ]] && \
#       xrandr --output HDMI-A-0 --auto --set TearFree on
#     xrandr --output eDP --off
# fi
