#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install essentials
brew install git bash-completion homebrew/completions/brew-cask-completion

# Install binary apps
brew install --cask \
  google-chrome firefox acorn \
  dropbox spotify karabiner-elements cyberduck \
  docker toggl-track iterm2 visual-studio-code bettertouchtool intellij-idea zoomus \
  supercollider

brew install \
    micro fish openssl thefuck watch pstree git-lfs autojump awscli direnv ffmpeg imagemagick jq tree unzip

cd ~

git clone https://github.com/tamlyn/.dotfiles.git .dotfiles

cd .dotfiles

# Symlink dotfiles
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore ~/.gitignore

mkdir -p ~/.config
ln -s ~/.dotfiles/.config/fish ~/.config/fish
ln -s ~/.dotfiles/.config/karabiner ~/.config/karabiner

./macos-settings.sh
