export PATH=/usr/local/bin:$PATH
source ~/.zsh_plugins.sh
setopt auto_cd
export PATH=~/development/flutter/bin:$PATH

## Completion stuff
autoload -U compinit
compinit

## Geometry stuff
PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
PROMPT_GEOMETRY_EXEC_TIME=true
PROMPT_GEOMETRY_GIT_CONFLICTS=true
GEOMETRY_COLOR_DIR="pink"

## Aliases
# clear screen
alias cl="clear"

# ls stuff
alias l="exa -l --git --group-directories-first"
alias la="exa -la --git --group-directories-first"

# pass
alias p="pass"
alias pg="pass generate"
alias pc="pass -c"
alias pr="pass rm"

# ssh
alias ale="ssh ****@aledec.com"
alias salewww="scp ****@aledec.com:/var/www/****/html"

# tmux
alias ts="tmux new -s"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias tka="tmux kill-server"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
