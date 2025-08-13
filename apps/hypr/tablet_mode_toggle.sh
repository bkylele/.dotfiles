#! /bin/bash

STATE_FILE="/tmp/tablet_mode_state"

tablet_progs=(
    squeekboard
    iio-hyprland
)

if [ -f "$STATE_FILE" ] && grep -q "on" "$STATE_FILE"; then
    for p in ${tablet_progs[@]}; do
        killall $p
    done

    echo "off" > "$STATE_FILE"
else
    for p in ${tablet_progs[@]}; do
        $p &
    done
    echo "on" > "$STATE_FILE"
fi

