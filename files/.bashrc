#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[1;34m\]\w \[\033[1;32m\]λ \[\033[00m\]"
if [[ -n "$GUIX_ENVIRONMENT" ]]; then
    PS1="\[\033[1;34m\]\w \[\033[1;32m\]λ \[\033[1;33m\][guix] \[\033[00m\]"
fi

export GUIX_LOC="$HOME/.cache/"
export SSL_CERT_DIR="$HOME/.guix-home/profile/etc/ssl/certs"
export SSL_CERT_FILE="$HOME/.guix-home/profile/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="$SSL_CERT_FILE"

export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_STATE_HOME="$HOME/.local/state/"
export XDG_CACHE_HOME="$HOME/.cache/"

export LESSHISTFILE="-"
export TERMINAL="alacritty"
export EDITOR="vim"

alias ..="cd .."
alias g="git"
alias ls="ls -h --color=auto"
alias la="ls -la"
alias ll="ls -l"
alias cd="z"
alias open="xdg-open"
alias vi="vim"

bind '"\C-x\C-d":"cd ~/.config/\C-m"'
bind '"\C-x\C-p":"cd ~/prjx/\C-m"'

eval "$(fzf --bash)"
eval "$(zoxide init bash)"
