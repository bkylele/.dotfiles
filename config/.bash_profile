#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if ! timeout 1s xset q &>/dev/null; then
    startx
fi
