#!/bin/bash
PRIMARY="eDP-1"
SECONDARY="HDMI-1"
PRIMARY_ON=$(xrandr | grep " connected " | grep -q "$PRIMARY" && echo "yes" || echo "no")
SECONDARY_ON=$(xrandr | grep " connected " | grep -q "$SECONDARY-1" && echo "yes" || echo "no")
if [[ "$PRIMARY_ON" == "yes" && "$SECONDARY_ON" == "yes"  ]]; then
    echo "BOTH"
elif [[ "$PRIMARY_ON" == "yes" && "$SECONDARY_ON" == "no"  ]]; then
    echo "PRIMARY"
elif [[ "$PRIMARY_ON" == "no" && "$SECONDARY_ON" == "yes"  ]]; then
    echo "SECONDARY"
elif [[ "$PRIMARY_ON" == "no" && "$SECONDARY_ON" == "no"  ]]; then
    echo "NONE"
fi
