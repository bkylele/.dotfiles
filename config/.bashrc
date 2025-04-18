#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Change prompt:
# PS1='[\u@\h \W]\$ '
PS1='\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;32m\]@\[\033[1;34m\]\h:\[\033[35m\]/\w\[\033[31m\]]\[\033[00m\] '

# Add '~/.dotfiles/shell/ to $PATH
export PATH=$PATH:~/.dotfiles/shell/

alias py='python'
alias vi='vim'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

alias :{w,wq,q,qa}="echo \"This isn't vi(m), it's $(basename $SHELL), sorry about that.\""


############################## Default Programs ###############################
export EDITOR="vim"
export TERMINAL="st"

################################## Clean-up ###################################
unset HISTFILE
export LESSHISTFILE="-"

export XDG_DAnTA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
