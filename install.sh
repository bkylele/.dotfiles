#! /bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

# Update packages
pacman -Syuq --noconfirm

TERM_PKGS=(
    neovim
    man
    tree
    tmux
    htop
    bash-completion
    fastfetch
    zoxide
    fzf
    ripgrep
    fd
    yazi
    diff-so-fancy
    starship
    nix
    swi-prolog
    spotify-player
)

FONT_PKGS=(
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    ttf-dejavu
    ttf-dejavu-nerd
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    ttf-nerd-fonts-symbols-mono
)

GUI_PKGS=(
    pipewire-pulse
    pulsemixer
    bluez
    bluetui
    grim
    slurp
    wl-clipboard
    brightnessctl
    wayland
    alacritty
    sway
    swaybg
    swaylock
    waybar
    hyprland
    hyprlock
    hypridle
    dunst
    firefox
)


# Essentials
pacman -Sq --needed --noconfirm "${TERM_PKGS[@]}" "${FONT_PKGS[@]}" "${GUI_PKGS[@]}"


# Yay and AUR packages
git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u $SUDO_USER makepkg -si --noconfirm
cd -

AUR_PKGS=(
    iio-hyprland
    squeekboard
    tofi
    vesktop
)

yay -Sq --noconfirm "${AUR_PKGS[@]}" 


# Create symlinks
user_home=/home/$SUDO_USER

mkdir -p $user_home/.config

for d in $user_home/.dotfiles/apps/* ; do
    ln -sf $d ~/.config/$(basename $d)
done
