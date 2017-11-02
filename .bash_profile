export PATH="/usr/local/sbin:$PATH:~/.bin"
export EDITOR=micro

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

# create directory and cd to it
mkcd () {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
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
