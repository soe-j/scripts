#!/bin/bash -eu

if [ $# = 1 ] && [ $1 = '-f' ]
then
  FORCE_LINK=1
else
  FORCE_LINK=0
fi


cd $(dirname $0)/..
SCRIPTS_ROOT=$(pwd)
SOURCE_HOME=$SCRIPTS_ROOT/home

if [ $(which brew) ]
then
  echo "brew is already installed."
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew doctor
brew bundle

git config --global core.excludesfile ~/.gitignore_global

find $SOURCE_HOME -type f | while read SOURCE_FILE
do
  TARGET_FILE="${HOME}${SOURCE_FILE#$SOURCE_HOME}"

  if [ $FORCE_LINK = 1 ]
  then
    ln -sf "$SOURCE_FILE" "$TARGET_FILE"
    echo "$TARGET_FILE is force linked!"
  else

    if [ -L "$TARGET_FILE" ]
    then
      echo "$TARGET_FILE is already exists."
    else
      ln -s "$SOURCE_FILE" "$TARGET_FILE"
      echo "$TARGET_FILE is linked!"
    fi
  fi
done

source ~/.bash_profile

cat $SCRIPTS_ROOT/directories | while read dir
do
  if [ -d ~/$dir ]
  then
    echo "~/$dir already exists."
  else
    mkdir ~/$dir
    echo "~/$dir created!"
  fi
done

cat $SCRIPTS_ROOT/vscode-extensions | while read extension
do
  if ! [[ $extension =~ ^\#.*$ ]]
  then
    code --install-extension $extension
  fi
done

defaults write com.apple.screencapture location ~/Pictures/Screencapture
defaults write com.apple.screencapture disable-shadow -boolean true
killall SystemUIServer
