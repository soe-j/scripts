#!/bin/bash -eu

cd $(dirname $0)/..
SCRIPTS_ROOT=$(pwd)

if [ $(which brew) ]
then
  echo "brew is already installed."
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew doctor
brew bundle

FORCE_FLAG=0

if [ -L ~/.bash_profile ] && [ $FORCE_FLAG != 1 ]
then
  echo '~/.bash_profile already exists.'
else
  ln -sf $SCRIPTS_ROOT/.bash_profile ~/.bash_profile
  echo '~/.bash_profile linked!'
fi

if [ -L ~/.bashrc ] && [ $FORCE_FLAG != 1 ]
then
  echo '~/.bashrc already exists.'
else
  ln -sf $SCRIPTS_ROOT/.bashrc ~/.bashrc
  echo '~/.bashrc linked!'
fi

source ~/.bash_profile

# git config
git config --global core.excludesfile ~/.gitignore_global
if [ -L ~/.gitignore_global ] && [ $FORCE_FLAG != 1 ]
then
  echo '~/.gitignore_global already exists.'
else
  ln -sf $SCRIPTS_ROOT/.gitignore_global ~/.gitignore_global
  echo '~/.gitignore_global linked!'
fi

if [ -L ~/.gemrc ] && [ $FORCE_FLAG != 1 ]
then
  echo '~/.gemrc already exists.'
else
  ln -sf $SCRIPTS_ROOT/.gemrc ~/.gemrc
  echo '~/.gemrc linked!'
fi

if [ -L ~/.rbenv/default-gems ] && [ $FORCE_FLAG != 1 ]
then
  echo '~/.rbenv/default-gems already exists.'
else
  ln -sf $SCRIPTS_ROOT/.rbenv/default-gems ~/.rbenv/default-gems
  echo '~/.rbenv/default-gems linked!'
fi

if [ -L ~/Library/Application\ Support/Code/User/settings.json ] && [ $FORCE_FLAG != 1 ]
then
  echo "Code is already set."
else
  ln -sf $SCRIPTS_ROOT/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json
  echo "Code settings linked!"
fi

cat $SCRIPTS_ROOT/vscode-extensions | while read line
do
  if ! [[ $line =~ ^\#.*$ ]]
  then
    code --install-extension $line
  fi
done

if [ -L ~/.config/karabiner/karabiner.json ] && [ $FORCE_FLAG != 1 ]
then
  echo "Karabiner is already set."
else
  ln -sf $SCRIPTS_ROOT/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
  echo "Karabiner settings linked!"
fi

cat $SCRIPTS_ROOT/directories | while read line
do
  if [ -d ~/$line ]
  then
    echo "~/$line already exists."
  else
    mkdir ~/$line
    echo "~/$line created!"
  fi
done

defaults write com.apple.screencapture location ~/Pictures/Screencapture
defaults write com.apple.screencapture disable-shadow -boolean true
killall SystemUIServer
