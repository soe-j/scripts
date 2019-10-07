export PS1='\n\[\033[47;30m\] \h \[\033[0m\] \[\033[49;32m\]\t\[\033[0m\] \[\033[49;36m\]\W\[\033[0m\] \[\033[47;30m\]\$\[\033[0m\] '

# homebrew
export PATH=/usr/local/sbin:$PATH

export PATH=$HOME/.dotfiles/bin:$PATH
ssh-add -K

eval "$(rbenv init -)"
eval "$(nodenv init -)"

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi
