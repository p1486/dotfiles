### options

setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_expand
setopt correct
setopt noautomenu
setopt extended_history
setopt magic_equal_subst
unsetopt beep
unsetopt correct_all
bindkey -v
HISTFILE=~/.zhist
HISTSIZE=10000
SAVEHIST=10000
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --exact --reverse --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}

zle -N select-history
bindkey "^r" select-history

### completion

autoload -Uz compinit && compinit
zstyle ":completion:*" menu select
setopt menu_complete
