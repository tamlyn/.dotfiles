export PATH="/usr/local/sbin:$PATH"

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
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# display local or remote IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
