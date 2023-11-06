### prompt

autoload -Uz promptinit && promptinit

autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{#FFD700}! "
zstyle ':vcs_info:git:*' unstagedstr "%F{#FFD700}󰦒 "
zstyle ':vcs_info:*' formats "on %F{#32CD32}%c%u%b "
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='%K{#000000}%F{#FF00FF}%n@%m%f %F{#00FFFF}%d%f '\$vcs_info_msg_0_'%f at %F{#0000FF}%*%f ;
%F{#0000FF}~%f %F{#00FF7F}󰅂%f%k '
precmd(){ vcs_info }
