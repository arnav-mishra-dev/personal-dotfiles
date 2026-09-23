autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git*' formats "\Uf02a2 %F{blue}%b%f %m%u%c %a "
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' %F{green}✚%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}●%f'

precmd() {
  vcs_info
  print -P "%B%~%b ${vcs_info_msg_0_}"
}
PROMPT='%B%(!.#.$)%b '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
source "$HOME/.cargo/env"
export EDITOR=nvim
export MANPAGER="nvim +Man!"
