#!/bin/sh
eval "$(~/Code/Scripts/polybar/colors.sh)"

VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
if echo "$VOL" | grep -q MUTED; then
    echo "%{B$RED}%{F$BACKGROUND} $ICON %{F-}%{B-} $VOL% "
    return
fi

if [ "$VOL" -lt 30 ]; then
    ICON=""
elif [ "$VOL" -lt 70 ]; then
    ICON=""
else
    ICON=""
fi
echo "%{B$MAGENTA}%{F$BACKGROUND} $ICON %{F-}%{B-} $VOL% "
