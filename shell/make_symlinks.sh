#! /bin/sh

# Variables
dotfiles_dir=~/.dotfiles

# Remove existing directories
rm -rf ~/.config > /dev/null 2>&1
rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.bash* > /dev/null 2>&1


# Make links
ln -sf $dotfiles_dir/config/vim/ ~/.vim
ln -sf $dotfiles_dir/config/ ~/.config
ln -sf $dotfiles_dir/config/.bashrc/ ~/.bashrc
ln -sf $dotfiles_dir/config/.bash_profile  ~/.bash_profile

