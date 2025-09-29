#!/bin/bash
PRIMARY="eDP-1"
SECONDARY="HDMI-1"
ACTIVE=$(xrandr --listactivemonitors | awk 'NR>1 {print $4}')

PRIMARY_ON="no"
SECONDARY_ON="no"
for mon in $ACTIVE; do
    [[ $mon == "$PRIMARY" ]] && PRIMARY_ON="yes"
    [[ $mon == "$SECONDARY" ]] && SECONDARY_ON="yes"
done

if [[ "$PRIMARY_ON" == "yes" && "$SECONDARY_ON" == "yes"  ]]; then
    echo "BOTH"
elif [[ "$PRIMARY_ON" == "yes" && "$SECONDARY_ON" == "no"  ]]; then
    echo "PRIMARY"
elif [[ "$PRIMARY_ON" == "no" && "$SECONDARY_ON" == "yes"  ]]; then
    echo "SECONDARY"
elif [[ "$PRIMARY_ON" == "no" && "$SECONDARY_ON" == "no"  ]]; then
    echo "NONE"
fi
