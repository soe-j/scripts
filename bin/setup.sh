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

brew doctor
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

rbenv versions | grep 2.5.0
if [ $? -eq 0 ]
then
  echo "Ruby is already 2.5.0"
else
  rbenv install 2.5.0
  rbenv global 2.5.0
  source ~/.bash_profile
fi

pyenv versions | grep 3.6.4
if [ $? -eq 0 ]
then
  echo "Python is already 3.6.4"
else
  pyenv install 3.6.4
  pyenv global 3.6.4
  source ~/.bash_profile
fi

if [ $(which aws) ]
then
  echo "awscli is already installed."
else
  pip install awscli
fi

if [ -d ~/.nodebrew ]
then
  echo "nodebrew is already setup."
else
  nodebrew setup_dirs
  source ~/.bash_profile
fi

set +e
nodebrew list | grep v6.10.3
if [ $? -eq 0 ]
then
  echo "Node is already v6.10.3."
else
  nodebrew install v6.10.3
  nodebrew use v6.10.3
fi
set -e

if [ -L ~/Library/Application\ Support/Code/User/settings.json ]
then
  echo "Code is already set."
else
  ln -sf $SCRIPTS_ROOT/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json
  echo "Code settings linked!"
fi
