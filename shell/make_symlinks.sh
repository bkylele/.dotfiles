#! /bin/sh

# Variables
dotfiles_dir=~/.dotfiles

# Remove existing directories
rm -rf ~/.config > /dev/null 2>&1
rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.bashrc > /dev/null 2>&1
rm -rf ~/.bash_profile > /dev/null 2>&1


# Make links
ln -sf $dotfiles_dir/config/vim/ ~/.vim
mkdir ~/.local/share/vim/undodir/
ln -sf $dotfiles_dir/config/ ~/.config
ln -sf $dotfiles_dir/config/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/config/.bash_profile ~/.bash_profile


# Download tmux plugin manager
rm -rf ~/.config/tmuxtpm/
git clone https://github.com/tmux-plugins/tpm ~/.config/tmuxtpm
tmux source ~/.config/tmux/tmux.conf


# Download suckless dwm, dmenu, and st
git clone https://github.com/bkylele/suckless-config.git /tmp/suckless/
cd /tmp/suckless/dwm
sudo make clean install
cd ../dmenu
sudo make clean install
cd ../st
sudo make clean install


cd ~/.dotfiles/shell/
rm -rf /tmp/suckless
