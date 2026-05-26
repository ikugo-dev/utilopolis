#!/bin/sh
eval "$(~/Code/Scripts/polybar/colors.sh)"

VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if echo "$VOL" | grep -q "MUTED"; then
    echo "%{B$RED}%{F$BACKGROUND}  %{F-}%{B-} MUTE"
    exit
fi

# VALUE=$(awk '{print int($2 * 100)}' "$VOL")
VALUE=$(echo "$VOL" | awk '{print int($2 * 100)}')
if [ "$VALUE" -lt 30 ]; then
    ICON=""
elif [ "$VALUE" -lt 70 ]; then
    ICON=""
else
    ICON=""
fi
echo "%{B$MAGENTA}%{F$BACKGROUND} $ICON %{F-}%{B-} $VALUE% "
