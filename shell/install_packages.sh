#! /bin/sh

log_file="$(dirname "$0")/install_progress_log.txt"

sudo pacman -Syuq --noconfirm

# -------------------
# Productivity Tools
# -------------------
echo "Trying to install command-line utils..." >> $log_file

sudo pacman -Sq --noconfirm tmux
if type -p tmux > /dev/null; then
    echo "tmux installed successfully"  >> $log_file
else
    echo "tmux FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm ranger
if type -p ranger > /dev/null; then
    echo "ranger intalled successfully"  >> $log_file
else
    echo "ranger FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm sl
if type -p sl > /dev/null; then
    echo "sl installed successfully"  >> $log_file
else
    echo "sl FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm ripgrep
if type -p rg > /dev/null; then
    echo "ripgrep intalled successfully"  >> $log_file
else
    echo "ripgrep FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm unzip
if type -p unzip > /dev/null; then
    echo "unzip intalled successfully"  >> $log_file
else
    echo "unzip FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm wget
if type -p wget > /dev/null; then
    echo "wget installed successfully"  >> $log_file
else
    echo "wget FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm curl
if type -p curl > /dev/null; then
    echo "curl installed successfully"  >> $log_file
else
    echo "curl FAILED TO INSTALL!" >> $log_file
fi

echo >> $log_file


# --------------
# Xorg and GUI
# --------------
echo "Trying to install GUI..." >> $log_file

sudo pacman -Sq --noconfirm xorg
if type -p Xorg > /dev/null; then
    echo "xorg installed successfully" >> $log_file
else
    echo "xorg FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm xorg-xinit
if type -p startx > /dev/null; then
    echo "xinit installed successfully" >> $log_file
else
    echo "xinit FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm sxhkd
if type -p sxhkd > /dev/null; then
    echo "sxhkd installed successfully" >> $log_file
else
    echo "sxhkd FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm mpv
if type -p mpv > /dev/null; then
    echo "mpv installed successfully" >> $log_file
else
    echo "mpv FAILED TO INSTALL!" >> $log_file
fi

sudo pacman -Sq --noconfirm zathura
if type -p zathura > /dev/null; then
    echo "zathura installed successfully" >> $log_file
else
    echo "zathura FAILED TO INSTALL!" >> $log_file
fi
sudo pacman -Sq --noconfirm zathura-pdf-mupdf

sudo pacman -Sq --noconfirm ttf-jetbrains-mono
sudo pacman -Sq --noconfirm ttf-jetbrains-mono-nerd
sudo pacman -Sq --noconfirm ttf-nerdfonts-symbols
sudo pacman -Sq --noconfirm ttf-nerdfonts-symbols-mono


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
