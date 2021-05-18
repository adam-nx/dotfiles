
###########################
#     ~ . z s h r c       #
###########################

zstyle ':completion:*' menu select
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit

set -o emacs
autoload -U select-word-style
select-word-style bash

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

export SAVEHIST=10000
export HISTSIZE=12000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

export TERM="xterm-256color"
export PATH=$HOME/bin:/usr/local/bin:$PATH:${HOME}/go/bin
export EDITOR='nvim'

# Aliases
alias vim=nvim
alias vi=nvim
alias reload="source ~/.zshrc"
alias sed=gsed

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$HOME/.local/bin"
eval "$(pyenv init -)"

eval $(thefuck --alias)

[ -s "/Users/adamn/.scm_breeze/scm_breeze.sh" ] && source "/Users/adamn/.scm_breeze/scm_breeze.sh"

eval "$(starship init zsh)"


[ -s "/Users/adam/.scm_breeze/scm_breeze.sh" ] && source "/Users/adam/.scm_breeze/scm_breeze.sh"
