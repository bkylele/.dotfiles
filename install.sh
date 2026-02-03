#! /bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

TERM_PKGS=(
    man
    bash-completion
    htop
    vim
    neovim
    zoxide
    fzf
    ripgrep
    fd
    diff-so-fancy
    fastfetch
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
    waybar
    niri
    chromium
)

AUR_PKGS=(
    iio-niri
    iio-sensor-proxy
    squeekboard
    tofi
    fuzzel
    vesktop
)

# AUR helper and pacman wrapper
git clone https://aur.archlinux.org/paru.git
cd paru
sudo -u $SUDO_USER makepkg -si --noconfirm
cd -

paru -Syuq --noconfirm
paru -Sq --needed --noconfirm "${TERM_PKGS[@]}" "${FONT_PKGS[@]}" "${GUI_PKGS[@]}" "${AUR_PKGS[@]}"

# Create symlinks
user_home=/home/$SUDO_USER

mkdir -p $user_home/.config

for d in $user_home/.dotfiles/apps/* ; do
    ln -sf $d $user_home/.config/$(basename $d)
done
