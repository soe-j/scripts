#!/bin/bash -eu

cd $(dirname $0)/..
SCRIPTS_ROOT=$(pwd)

if [ -f ~/.bash_profile ]
then
  echo '~/.bash_profile already exists.'
else
  ln -s $SCRIPTS_ROOT/.bash_profile ~/.bash_profile
  source ~/.bash_profile
  echo '~/.bash_profile linked!'
fi

if [ ! $(which brew) ]
then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew bundle

if [ -f ~/.rbenv/default-gems ]
then
  echo '~/.rbenv/default-gems already exists.'
else
  ln -s $SCRIPTS_ROOT/.rbenv/default-gems ~/.rbenv/default-gems
  echo '~/.rbenv/default-gems linked!'
fi
