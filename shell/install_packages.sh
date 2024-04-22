#! /bin/sh

log_file="$(dirname "$0")/install_progress_log.txt"

sudo pacman -Syuq --noconfirm

download_package()  {
    sudo pacman -S --noconfirm $1
    if type -p $1 > /dev/null; then
        echo "$1 installed successfully"  >> $log_file
    else
        echo "$1 FAILED TO INSTALL!" >> $log_file
    fi
}


# -------------------
# Productivity Tools
# -------------------

read -n 1 -p "Install comand-line utils? [y/n]" prompt
if [[ $prompt =~ [yY] ]] then
    echo "Trying to install utils..." >> $log_file

    download_package tmux
    download_package ranger
    download_package bash-completion
    download_package curl
    download_package sl

echo >> $log_file
fi

# --------------
# Xorg and GUI
# --------------

read -n 1 -p "Install graphical environment? [y/n]" prompt
if [[ $prompt =~ [yY] ]] then
    echo "Trying to install GUI..." >> $log_file

    download_package xorg
    download_package xorg-xinit
    download_package xwallpaper
    download_package brightnessctl
    download_package sxhkd

    download_package xclip
    download_package pamixer
    download_package sxiv
    download_package xournalpp
    download_package mpv
    download_package zathura
    sudo pacman -Sq --noconfirm zathura-pdf-mupdf
    sudo pacman -Sq --noconfirm imagemagick


    echo "Trying to install fonts..." >> $log_file
    sudo pacman -Sq --noconfirm ttf-jetbrains-mono
    sudo pacman -Sq --noconfirm ttf-jetbrains-mono-nerd
    sudo pacman -Sq --noconfirm ttf-nerd-fonts-symbols
    sudo pacman -Sq --noconfirm ttf-nerd-fonts-symbols-mono
    sudo pacman -Sq --noconfirm noto-fonts-cjk
    sudo pacman -Sq --noconfirm noto-fonts-emojis

    echo >> $log_file
fi


# --------------
# Summary
# --------------
echo -e "\n====== Summary ======\n"
cat $log_file
echo >> $log_file
rm $log_file
