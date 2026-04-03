#! /usr/bin/env -S nix shell nixpkgs#bash nixpkgs#wf-recorder nixpkgs#killall nixpkgs#slurp nixpkgs#ffmpegthumbnailer nixpkgs#libnotify nixpkgs#xdg-user-dirs --command bash

DEST=$(xdg-user-dir VIDEOS)
DEST=${DEST:-"~/Videos"}

if [ $(pidof wf-recorder) ]; then

    killall wf-recorder -s SIGINT

    sleep 0.1
    ffmpegthumbnailer -i $DEST/recording.mkv -o $DEST/thumbnail.png

    sleep 0.1
    notify-send -i $DEST/thumbnail.png "Recording captured"

    mv $DEST/recording.mkv $DEST/$(date +'%Y-%m-%d_%H-%M-%S').mkv
    rm $DEST/thumbnail.png

else

    wf-recorder -a -g "$(slurp)" -f $DEST/recording.mkv

fi
