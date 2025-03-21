#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH for Zsh
echo >> /Users/tamlyn/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tamlyn/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install essentials
brew install git

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

brew install --cask google-chrome

xargs brew install < brew-packages.txt
xargs brew install --cash < brew-casks.txt