#! /bin/sh

log_file="$(dirname "$0")/install_progress_log.txt"

sudo pacman -Syuq --noconfirm


download_package() {
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

echo "Trying to install command-line utils..." >> $log_file

download_package(tmux)
download_package(ranger)
download_package(sl)
download_package(ripgrep)
download_package(unzip)
download_package(wget)
download_package(curl)

echo >> $log_file


# --------------
# Xorg and GUI
# --------------
echo "Trying to install GUI..." >> $log_file

download_package(xorg)
download_package(xorg-xinit)
download_package(xwallpaper)
download_package(brightnessctl)
download_package(sxhkd)
download_package(zathura)
download_package(zathura-pdf-mupdf)

echo "Trying to fonts..." >> $log_file
sudo pacman -Sq --noconfirm ttf-jetbrains-mono
sudo pacman -Sq --noconfirm ttf-jetbrains-mono-nerd
sudo pacman -Sq --noconfirm ttf-nerd-fonts-symbols
sudo pacman -Sq --noconfirm ttf-nerd-fonts-symbols-mono
sudo pacman -Sq --noconfirm noto-fonts-cjk


if type -p yay > /dev/null; then
    yay -Sq --noconfirm brave-bin
    if type -p brave > /dev/null; then
        echo "brave installed successfully" >> $log_file
    else
        echo "brave FAILED TO INSTALL!" >> $log_file
    fi
else
    echo "yay not available, skipping brave install" >> $log_file
fi

echo >> $log_file


# --------------
# Summary
# --------------
echo -e "\n====== Summary ======\n"
cat $log_file
echo >> $log_file
rm $log_file
