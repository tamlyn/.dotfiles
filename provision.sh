#!/bin/sh

# Ask for the administrator password upfront
#sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Symlink dotfiles
ln -s ./.bash_profile ~/.bash_profile
ln -s ./.gitconfig ~/.gitconfig

mkdir -p ~/.config
ln -s ./fish ~/.config/fish

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install essentials
brew install git bash-completion homebrew/completions/brew-cask-completion

# brew install apple-gcc42

# Install binary apps
brew cask install \
  google-chrome firefox acorn flycut \
  skype dropbox spotify karabiner-elements jitouch scroll-reverser cyberduck \
  java phpstorm atom virtualbox docker toggl-desktop \
  spectacle microsoft-office iterm2

brew install \
    redis mongodb postgresql \
    composer n micro fish \
    openssl fzf thefuck watch pstree

# install node
n lts

# npm bash completions
npm completion > /usr/local/etc/bash_completion.d/npm

# Install CLI apps from NPM
npm i -g yarn

# Add key to SSH agent
/usr/bin/ssh-add -K ~/.ssh/id_rsa

./macos-settings.sh
