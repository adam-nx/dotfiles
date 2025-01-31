######################
#  ~ / . z s h r c   #
######################

fpath+=~/.zsh_functions
fpath+=~/.zsh/zsh-completions/src

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

source ~/.zsh/zsh-abbr/zsh-abbr.zsh

#####  key bindings  ######
bindkey '^[[1;3C' forward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[1;5D' backward-word

# bindkey "^[[A" history-search-backward
# bindkey "^[[B" history-search-forward

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

# export TERM="xterm-256color"
export TERMINAL="alacritty"
export EDITOR='nvim'
export LESS="--RAW-CONTROL-CHARS --use-color"

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH":"$HOME/fvm/default/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export ANDROID_HOME="${HOME}/Android/Sdk"
export PATH="${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/latest/bin"


# Aliases
alias vimdiff='nvim -d'
alias vim=nvim
alias vi=nvim
alias reload="source ~/.zshrc"
alias l="ls -ltr"
alias gsed=sed
alias pbcopy="xclip -selection clipboard -i"
# abbr gup="git stash && gco master && gpl && gco - && grb master && git stash pop"

[ -s "${HOME}/.scm_breeze/scm_breeze.sh" ] && source "${HOME}/.scm_breeze/scm_breeze.sh"

# export FZF_DEFAULT_OPTS='--height 30% --layout reverse'
zmodload -F zsh/parameter -p:history # possible fix for partial history
source <(fzf --zsh)

source <(pillar completion zsh)
source <(kubectl completion zsh)
[[ -f /home/adam/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/adam/.config/.dart-cli-completion/zsh-config.zsh || true

export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
export HISTORY_SUBSTRING_SEARCH_FUZZY=1
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


eval "$(starship init zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/adam/.dart-cli-completion/zsh-config.zsh ]] && . /home/adam/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "/home/adam/.scm_breeze/scm_breeze.sh" ] && source "/home/adam/.scm_breeze/scm_breeze.sh"
