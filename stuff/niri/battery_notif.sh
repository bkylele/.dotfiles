#! /usr/bin/env -S nix shell nixpkgs#bash nixpkgs#libnotify --command bash

power="$(cat /sys/class/power_supply/BAT1/capacity)"
plugged="$(cat /sys/class/power_supply/ADP1/online)"

while true; do
    if [ $plugged -eq 0 ]; then
        if [ $power -lt 20 ]; then
            notify-send -u critical "🪫 Battery Low: $power" "Plug in laptop soon"
        fi
    fi
    sleep 60
done
