# this file should contain stuff specific to bash

# ALIASES

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ll='ls -l'


# PROMPT with git branch

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt for dark bg
export PS1='\[\e[32m\]\w\[\e[m\]\[\e[33m\]$(parse_git_branch)\[\e[m\] $ '

# Prompt for white bg
# export PS1='\[$(tput setaf 4)\]\w\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] $ '

# git branch name autocompletion
source ~/.git-completion.bash
