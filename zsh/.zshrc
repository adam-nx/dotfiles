######################
#  ~ / . z s h r c   #
######################

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then 
	compinit -i
else
	compinit -C -i
fi

zmodload -i zsh/complist

set -o emacs
autoload -U select-word-style
select-word-style bash

#####  key bindings  ######
bindkey '^[[1;3C' forward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[1;5D' backward-word

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=50000


setopt always_to_end # move cursor to end if word had one match
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt interactive_comments # allow comments in interactive shells
setopt share_history # share history between different instances
unsetopt correct_all # autocorrect commands

export TERM="xterm-256color"
export TERMINAL="alacritty"
export PATH=$HOME/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export EDITOR='nvim'

# Aliases
alias vim=nvim
alias vi=nvim
alias reload="source ~/.zshrc"
alias l="ls -ltr"
alias gsed=sed
alias pbcopy="xclip -selection clipboard -i"

[ -s "${HOME}/.scm_breeze/scm_breeze.sh" ] && source "${HOME}/.scm_breeze/scm_breeze.sh"

export FZF_DEFAULT_OPTS='--height 30% --layout reverse'
source <(fzf --zsh)

source <(pillar completion zsh)
source <(kubectl completion zsh)

eval "$(starship init zsh)"
