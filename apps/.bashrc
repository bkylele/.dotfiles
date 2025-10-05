#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Change prompt:
PS1='\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;32m\]@\[\033[1;34m\]\h:\[\033[35m\]/\w\[\033[31m\]]\[\033[00m\] '

#
# Default Programs
#
export EDITOR="nvim"
export TERMINAL="alacritty"

#
# Clean-up 
#
# unset HISTFILE
# export LESSHISTFILE="-"

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
alias ls='eza'
alias la='ls -lah'
alias ll='ls -lh'
alias vi=$EDITOR
alias g='git'
alias open='xdg-open'
alias cd='z'
alias cat='bat'

eval "$(fzf --bash)"
eval "$(zoxide init bash)"
# eval "$(starship init bash)"

if [ -n "$GUIX_ENVIRONMENT" ]; then
    if [[ $PS1 =~ (.*)" " ]]; then
        PS1="${BASH_REMATCH[1]} \[\033[1;34m\](guix)\[\033[00m\] "
    fi
fi

