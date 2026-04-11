#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='\[\033[1;34m\]\w \[\033[1;32m\]λ\[\033[00m\] '

export EDITOR="nvim"
export TERMINAL="kitty"
# for kitty cmdline editing
export VISUAL='~/.local/share/nvim/site/pack/core/opt/kitty-scrollback.nvim/scripts/edit_command_line.bash'

alias ..='cd ..'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias vi=$EDITOR
alias py='python'
alias cd='z'
alias cat='bat'
alias htop='btop'
alias open='xdg-open'

alias bashconf='vi ~/.bashrc && source ~/.bashrc'
alias viconf='cd ~/.config/nvim && vi -c "e ~/.config/nvim/init.lua" && cd -'

alias nixconf='cd ~/.dotfiles/ && vi ~/.dotfiles/configuration.nix && cd -'
alias nixsw='nh os switch ~/.dotfiles/'

eval "$(fzf --bash)"
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"

flakify() {
  if [ ! -e flake.nix ]; then
    nix flake new -t github:nix-community/nix-direnv .
  elif [ ! -e .envrc ]; then
    echo "use flake" > .envrc
    direnv allow
  fi
  $EDITOR flake.nix
}

unfree() {
    NIXPKGS_ALLOW_UNFREE=1 $@ --impure
}
