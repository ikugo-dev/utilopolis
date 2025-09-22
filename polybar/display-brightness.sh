#!/bin/bash
BRIGHTNESS_VALUE=$1
if [ "$BRIGHTNESS_VALUE" -lt 30 ]; then
    BRIGHTNESS_ICON=''
elif [ "$BRIGHTNESS_VALUE" -lt 70 ]; then
    BRIGHTNESS_ICON=''
else 
    BRIGHTNESS_ICON=''
fi

# extracting colors
eval "$(
  awk -F '=' '
    /^[^#].*=.*/ {
      key=$1; val=$2
      gsub(/^[ \t]+|[ \t]+$/, "", key)
      gsub(/^[ \t]+|[ \t]+$/, "", val)
      printf "%s=%s\n", toupper(key), val
    }
  ' ~/.config/polybar/colors.ini
)"

echo "%{B$BLUE}%{F$BACKGROUND} $BRIGHTNESS_ICON %{F-}%{B-} $BRIGHTNESS_VALUE% "
