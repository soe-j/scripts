
eval "$(rbenv init -)"
eval "$(pyenv init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi
