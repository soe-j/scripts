export PS1='\n\[\033[46;30m\]\#\[\033[0m\] \[\033[49;39m\]\h\[\033[0m\]\[\033[49;32m\]\t\[\033[0m\]\[\033[49;36m\]\W\[\033[0m\] \[\033[47;30m\]\$\[\033[0m\] '

export PATH=$HOME/.dotfiles/bin:$PATH

eval "$(rbenv init -)"
eval "$(nodenv init -)"

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi
