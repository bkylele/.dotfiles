#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind '"\C-x\C-d":"cd ~/.config/\C-m"'
bind '"\C-x\C-p":"cd ~/prjx/\C-m"'

eval "$(fzf --bash)"
eval "$(zoxide init bash)"
