#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install essentials
brew install git

# Install binary apps
brew install --cask \
  ableton-live-suite \
  cyberduck \
  disk-inventory-x \
  docker \
  google-chrome \
  iterm2 \
  karabiner-elements \
  keybase \
  maccy \
  microsoft-excel \
  middleclick \
  neardrop \
  ngrok \
  notunes \
  pycharm-ce \
  spotify \
  steam \
  visual-studio-code \
  vlc \
  webstorm 

brew install \
    asdf \
    autojump \
    awscli \
    direnv \
    ffmpeg \
    fish \
    fx \
    gh \
    git-crypt \
    git-lfs \
    imagemagick \
    jq \
    micro \
    openssl \
    postgresql \
    pstree \
    thefuck \
    tree \
    unrar \
    unzip \
    watch \
    watchman

git clone https://github.com/tamlyn/.dotfiles.git ~/.dotfiles

# Symlink dotfiles
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore ~/.gitignore
mkdir -p ~/.config
ln -s ~/.dotfiles/.config/fish ~/.config/fish
ln -s ~/.dotfiles/.config/karabiner ~/.config/karabiner

~/.dotfiles/macos-settings.sh

# add fish as a valid shell
echo $(which fish) | sudo tee -a /etc/shells

# set fish to be the default shell
chsh -s $(which fish)
