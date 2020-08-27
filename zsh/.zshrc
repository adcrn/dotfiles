export EDITOR=nvim
export PATH=/usr/local/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export DEV=~/dev
export PER=~/dev/personal
export PRO=~/dev/professional
setopt auto_cd

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

source "${HOME}/.zgen/zgen.zsh"

autoload -U promptinit; promptinit
prompt pure

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # bulk load
    zgen loadall <<EOPLUGINS
        mafredri/zsh-async
        sindresorhus/pure
        mattmc3/zsh-safe-rm
        unixorn/autoupdate-zgen
        zsh-users/zsh-autosuggestions
        zsh-users/zsh-completions
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-syntax-highlighting
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # save all to init script
    zgen save
fi

## Aliases
## "regular" type
# clear screen
alias cl="clear"

# git
alias st="git status"
alias pul="git pull"
alias gp="git push"
alias -s git="git clone"

# videos
alias iina="/Applications/IINA.app/Contents/MacOS/iina-cli"
alias -s {avi,flv,mkv,mov,mp4,mpeg,mpg,ogm,webm}="/Applications/IINA.app/Contents/MacOS/iina-cli"

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

# vim
alias v="nvim"
alias vim="nvim"

## "fancy" type
alias dev="cd ~/dev/"
alias personal="cd ~/dev/personal"
alias business="cd ~/dev/professional"

alias reload="exec zsh -l"
alias zedit="$EDITOR $HOME/.zshrc"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

function pub_transfer() {
    scp "$1" ohell@naw.wtf:~/public;
    echo "https://hel.naw.wtf/$1:t" | pbcopy
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
