#! /bin/bash

STATE_FILE="/tmp/tablet_mode_state"

touch $STATE_FILE

if [ -f "$STATE_FILE" ] && grep -q "on" "$STATE_FILE" && grep open /proc/acpi/button/lid/LID0/state; then
    killall squeekboard
    killall iio-hyprland
    echo "off" > "$STATE_FILE"
else
    squeekboard &
    iio-hyprland &
    echo "on" > "$STATE_FILE"
fi

