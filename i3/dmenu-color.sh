#!/bin/sh
. "${HOME}/.cache/wal/colors.sh"

-nb "#0B0E14" 
-nf "#BFBDB6" 
-sb "#FF8F40" 
-sf "#0B0E14"
if [ $# != 0 ]; then
    dmenu -fn "Hurmit Nerd Font-12" \
        -nb "$color0" \
        -nf "$color15" \
        -sb "$color6" \
        -sf "$color0" \
        "$@"
else
    dmenu_run -fn "Hurmit Nerd Font-12" \
        -nb "$color0" \
        -nf "$color15" \
        -sb "$color6" \
        -sf "$color0"
fi
