#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Change prompt:
PS1='\[\033[1;34m\]\w \[\033[1;32m\]λ \[\033[00m\]'

export NIX_REMOTE=daemon

#
# Default Programs
#
export EDITOR="nvim"
export TERMINAL="alacritty"

#
# Clean-up 
#

export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_STATE_HOME="$HOME/.local/state/"
export XDG_CACHE_HOME="$HOME/.cache/"

# binds
bind '"\C-x\C-d":"cd ~/.config/\C-m"'
bind '"\C-x\C-p":"cd ~/prjx/\C-m"'

# aliases
alias ..='cd ..'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias vi=$EDITOR
alias g='git'
alias cd='z'
alias open='xdg-open'

eval "$(fzf --bash)"
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
