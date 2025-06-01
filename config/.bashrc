#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Change prompt:
PS1='\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;32m\]@\[\033[1;34m\]\h:\[\033[35m\]/\w\[\033[31m\]]\[\033[00m\] '

# shell aliases
alias ..='cd ..'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'

# tmux aliases
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'

# git aliases
alias gs='git status --short'
alias ga='git add'
alias gc='git commit -v'
alias gd='git diff'
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'"
alias gcl='git clone'
alias gap='git add --patch'

# misc aliases
alias vi='vim'
alias open='xdg-open'
alias cd='z'

eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"

#
# Default Programs
#
export EDITOR="vim"
export TERMINAL="alacritty"

#
# Clean-up 
#
unset HISTFILE
export LESSHISTFILE="-"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

