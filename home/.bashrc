# General
alias ll='ls -la'
alias grep='grep -v grep | grep'
alias gdiff='git diff --no-index'
alias chrome='open -a "Google Chrome.app"'
alias safari='open -a "safari.app"'

# Git
source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
alias git-branch-default='git remote show origin | grep "HEAD branch" | sed "s/.*: //"'
alias git-branch-delete-merged='git branch --merged | egrep -v "(\*|$(git-branch-default))" | xargs git branch -d'

# Ruby
alias be='bundle exec'
