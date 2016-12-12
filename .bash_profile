export PATH="/usr/local/sbin:$PATH:~/.bin"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=/usr/local/opt/go/libexec
export EDITOR=nano

# Node.js
export NVM_DIR=~/.nvm
# hack to delay loading nvm until first use of node
alias node='unalias node npm; source $(brew --prefix nvm)/nvm.sh; source <(npm completion); node $@'
alias npm='unalias node npm; source $(brew --prefix nvm)/nvm.sh; source <(npm completion); npm $@'

# Extra env vars
if [ -f ~/.dotfiles/private.sh ]; then
    . ~/.dotfiles/private.sh
fi

# source Homebrew Bash completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Bash prompt
export PS1='\[\e]0;${PWD##*/}\a\][\u \e[31m\w\e[033m$(__git_ps1)\e[00m]\n\$ '

# aliases
alias ls="ls -laFG"
alias ..="cd .."
alias ...="cd ../.."
alias git=hub

# create directory and cd to it
mkcd () {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# Switch docker pointer to another host (dmenv my_remote_host)
dmenv () {
  eval "$(docker-machine env ${1:-default})"
}

# Find running processes matching search
psg () {
  ps aux | { head -1; grep --color=auto -i $1; }
}

# Show process listening on a port
port () {
  lsof -ni:$1 | (read header; echo "$header"; grep LISTEN;)
}

# display local or remote IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
