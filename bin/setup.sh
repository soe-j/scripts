#!/bin/bash -eu

cd $(dirname $0)/..
SCRIPTS_ROOT=$(pwd)

if [ -f ~/.bash_profile ]
then
  echo '~/.bash_profile already exists.'
else
  ln -s $SCRIPTS_ROOT/.bash_profile ~/.bash_profile
  echo '~/.bash_profile linked!'
fi
source ~/.bash_profile

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

rbenv install 2.5.0
rbenv global 2.5.0

pyenv install 3.6.4
pyenv global 3.6.4
pip install awscli

nodebrew install v6.10.3
nodebrew use v6.10.3
