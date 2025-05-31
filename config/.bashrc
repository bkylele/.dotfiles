#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Change prompt:
PS1='\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;32m\]@\[\033[1;34m\]\h:\[\033[35m\]/\w\[\033[31m\]]\[\033[00m\] '

# Add '~/.dotfiles/shell/ to $PATH

alias ..='cd ..'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

alias vi='vim'
alias pl='swipl -q'
alias open='xdg-open'
alias cd='z'

eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"

############################## Default Programs ###############################
export EDITOR="vim"
export TERMINAL="alacritty"

################################## Clean-up ###################################
unset HISTFILE
export LESSHISTFILE="-"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

