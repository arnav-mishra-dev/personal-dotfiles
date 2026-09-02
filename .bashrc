#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
source "$HOME/.cargo/env"
export EDITOR=nvim
export VISUAL=neovide

function nvide() {
	neovide "$1" & disown
}
