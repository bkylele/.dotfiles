#! /bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

# Update packages
sudo pacman -Syuq --noconfirm

# Essentials
sudo pacman -S bash-completion git vim yazi zoxide fastfetch less nix \
    ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk \
    noto-fonts-emoji noto-fonts-extra ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono \
    pulseaudio pulsemixer bluez bluetui grim wl-clipboard brightnessctl \
    wayland sway waybar swaybg swaylock dunst rofi \
    firefox discord

user_home=/home/$SUDO_USER

# Create symlinks
rm -rf $user_home/.config/
rm -rf $user_home/.bashrc
rm -rf $user_home/.bash_profile

ln -sf $user_home/.dotfiles/config/  $user_home/.config
ln -sf $user_home/.bashrc            $user_home/.dotfiles/config/.bashrc
ln -sf $user_home/.bash_profile      $user_home/.dotfiles/config/.bash_profile
