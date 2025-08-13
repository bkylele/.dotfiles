#! /bin/sh

for d in apps/*; do
    ln -sf $d ~/.dotfiles/$(basename $d)
done
