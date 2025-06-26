#! /bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

# Update packages
pacman -Syuq --noconfirm

# Essentials
pacman -Sq --noconfirm bash-completion fastfetch fzf yazi ripgrep fd diff-so-fancy nix \
    ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk \
    noto-fonts-emoji noto-fonts-extra ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono \
    xdg-desktop-portal xdg-desktop-portal-wlr \
    pulseaudio pulsemixer bluez bluetui grim wl-clipboard brightnessctl \
    wayland sway waybar swaybg swaylock dunst rofi \
    firefox

# Yay and AUR packages
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm
cd -

yay -Sq --noconfirm rot8 squeekboard tofi vesktop

user_home=/home/$SUDO_USER

# Create symlinks
rm -rf $user_home/.config/ && \
    ln -sf $user_home/.dotfiles/config/ $user_home/.config

rm -rf $user_home/.bashrc \
    ln -sf $user_home/.bashrc $user_home/.dotfiles/config/.bashrc

rm -rf $user_home/.bash_profile \
    ln -sf $user_home/.bash_profile $user_home/.dotfiles/config/.bash_profile

