# General
alias ll='ls -la'
alias grep='grep -v grep | grep'
alias gdiff='git diff --no-index'
alias chrome='open -a "Google Chrome.app"'
alias safari='open -a "safari.app"'

# Git
source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
alias gf='git fetch -p'
alias git-branch-default='git remote show origin | grep "HEAD branch" | sed "s/.*: //"'
alias git-branch-delete-merged='git branch --merged | egrep -v "(\*|$(git-branch-default))" | xargs git branch -d'
alias git-reg='gf && git add . && git stash && git checkout master && git merge origin/master && git-branch-delete-merged && git stash pop'
alias git-open-diff-file='code $(git diff `git show-branch --merge-base master HEAD` HEAD --name-only)'

# Ruby
alias be='bundle exec'

# AWS
complete -C $(which aws_completer) aws
