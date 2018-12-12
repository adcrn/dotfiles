export PATH=/usr/local/bin:$PATH
export PATH=~/.cargo/bin:$PATH
source ~/.zsh_plugins.sh
setopt auto_cd

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

## Completion stuff
autoload -U compinit
compinit

## Aliases
# clear screen
alias cl="clear"

# git
alias st="git status"
alias pul="git pull"
alias gp="git push"

# ls stuff
alias l="exa -l --git --group-directories-first"
alias la="exa -la --git --group-directories-first"
alias lt="exa -T"

# pass
alias p="pass"
alias pg="pass generate"
alias pc="pass -c"
alias pr="pass rm"

# pipes.sh
alias pipes="pipes.sh -p 5 -R"

# time
alias t="/usr/bin/time"

# tmux
alias ts="tmux new -s"
alias ta="tmux a -t"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias tka="tmux kill-server"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
