export PATH="/usr/local/sbin:$PATH:~/.bin"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=/usr/local/opt/go/libexec
export EDITOR=nano

# Extra env vars
if [ -f ~/.dotfiles/private.sh ]; then
    . ~/.dotfiles/private.sh
fi

# source Homebrew Bash completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

eval $(thefuck --alias)

# Bash prompt
export PS1='\[\e]0;${PWD##*/}\a\][\u \e[31m\w\e[033m$(__git_ps1)\e[00m]\n\$ '

# aliases
alias ls="ls -laFGog"
alias ..="cd .."
alias ...="cd ../.."
alias git=hub
alias npm-exec='PATH=$(npm bin):$PATH'
alias watch="watch -ctn1"

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

debugnode () {
    PROCESSES=$(pgrep -fl node)
    IFS=$'\n'
    PS3='Select which process to debug: '

    select PROCESS in $PROCESSES
    do
      IFS=' '
      PARTS=( $PROCESS )
      kill -SIGUSR1 $PARTS
      break
    done
}

snapshot () {
  if [ -n "$1" ]; then
        git update-ref -m "$1" refs/stash "$(git stash create \"$1\")"
  else
          HASH=`git stash create`
          MESSAGE=`git log --no-walk --pretty="tformat:%-s" "$HASH"`
          git update-ref -m "$MESSAGE" refs/stash "$HASH"
  fi
}

# display local or remote IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
