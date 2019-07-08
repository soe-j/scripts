#!/bin/bash -eu

cd $(dirname $0)/..
SCRIPTS_ROOT=$(pwd)

if [ -L ~/.bash_profile ]
then
  echo '~/.bash_profile already exists.'
else
  ln -sf $SCRIPTS_ROOT/.bash_profile ~/.bash_profile
  echo '~/.bash_profile linked!'
fi

if [ -L ~/.bashrc ]
then
  echo '~/.bashrc already exists.'
else
  ln -sf $SCRIPTS_ROOT/.bashrc ~/.bashrc
  echo '~/.bashrc linked!'
fi

if [ -L ~/.bash_profile.d ]
then
  echo '~/.bash_profile.d already exists.'
else
  ln -sf $SCRIPTS_ROOT/.bash_profile.d ~/.bash_profile.d
  echo '~/.bash_profile.d linked!'
fi

source ~/.bash_profile

if [ $(which brew) ]
then
  echo "brew is already installed."
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew doctor
brew bundle

# git config
git config --global core.excludesfile ~/.gitignore_global
if [ -L ~/.gitignore_global ]
then
  echo '~/.gitignore_global already exists.'
else
  ln -sf $SCRIPTS_ROOT/.gitignore_global ~/.gitignore_global
  echo '~/.gitignore_global linked!'
fi

if [ -L ~/.gemrc ]
then
  echo '~/.gemrc already exists.'
else
  ln -sf $SCRIPTS_ROOT/.gemrc ~/.gemrc
  echo '~/.gemrc linked!'
fi

if [ -L ~/.rbenv/default-gems ]
then
  echo '~/.rbenv/default-gems already exists.'
else
  ln -sf $SCRIPTS_ROOT/.rbenv/default-gems ~/.rbenv/default-gems
  echo '~/.rbenv/default-gems linked!'
fi

if [ -L ~/Library/Application\ Support/Code/User/settings.json ]
then
  echo "Code is already set."
else
  ln -sf $SCRIPTS_ROOT/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json
  echo "Code settings linked!"
fi

if [ -L ~/.config/karabiner/karabiner.json ]
then
  echo "Karabiner is already set."
else
  ln -sf $SCRIPTS_ROOT/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
  echo "Karabiner settings linked!"
fi

if [ -L ~/workspace ]
then
  echo '~/workspace already exists.'
else
  ln -sf $SCRIPTS_ROOT/workspace ~/workspace
  echo '~/workspace linked!'
fi

# screen capture settings
if [ -L ~/Pictures/Screencapture ]
then
  echo '~/Pictures/Screencapture already exists.'
else
  ln -sf $SCRIPTS_ROOT/Pictures/Screencapture ~/Pictures/Screencapture
  echo '~/Pictures/Screencapture linked!'
fi

defaults write com.apple.screencapture location ~/Pictures/Screencapture
defaults write com.apple.screencapture disable-shadow -boolean true
killall SystemUIServer
