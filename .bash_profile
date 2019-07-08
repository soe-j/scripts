export PATH=$HOME/scripts/bin:$PATH

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi
