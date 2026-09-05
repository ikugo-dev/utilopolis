#!/bin/sh

while [ "$select" != "No" ] && [ "$select" != "Yes" ]; do
    select=$(printf "No\nYes" | \
        ~/Code/Scripts/i3/dmenu-color.sh \
            -p "You pressed the reboot shortcut. Do you really want to reboot i3? This will end your X session.")
    if [ -z "$select" ]; then
        exit 0
    fi
done

if [ "$select" = "No" ]; then
    exit 0
fi

systemctl reboot
