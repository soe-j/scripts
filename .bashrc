# General
alias ll='ls -la'
alias chrome='open -a "Google Chrome.app"'
alias safari='open -a "safari.app"'

# Git
source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
alias git-delete-merged-branch='git branch --merged | egrep -v "(\*|master)" | xargs git branch -d'

# Ruby
alias be='bundle exec'

# ssh-config completion
source ~/scripts/completion.d/ssh-completion.bash
