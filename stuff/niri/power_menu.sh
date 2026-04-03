#!/usr/bin/env -S nix run nixpkgs#bash

options="Poweroff\nReboot\nSuspend"
choice=$(echo -e "$options" | fuzzel --dmenu)

case "$choice" in
    "Suspend")      systemctl suspend ;;
    "Reboot")       systemctl reboot ;;
    "Poweroff")     systemctl poweroff ;;
    *)              exit 0 ;;
esac
