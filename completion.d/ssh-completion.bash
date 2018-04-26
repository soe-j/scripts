#!/usr/bin/env bash -eu

SSH_CONFIG_PATH=~/.ssh/config

for host_row in $(grep '^Host ' $SSH_CONFIG_PATH)
do
  host_list="$host_list ${host_row#Host}"
done

setting_complete () {
  COMPREPLY=( $(compgen -W "$host_list" -- ${COMP_WORDS[COMP_CWORD]}) )
}

complete -F setting_complete ssh
