if [ -d ~/.bash_profile.d ] && [ -f ~/.bash_profile.d/*.bash_profile ]
then
  for FILES in $(ls ~/.bash_profile.d/*.bash_profile)
  do
    source $FILES
  done
fi

eval "$(rbenv init -)"
eval "$(pyenv init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi
