export PATH=$HOME/.dotfiles/bin:$PATH

eval "$(rbenv init -)"
eval "$(nodenv init -)"

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi
