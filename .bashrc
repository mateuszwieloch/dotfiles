# this file should contain stuff specific to bash
eval "$(rbenv init -)"

# aliases {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ll='ls -l'
alias ls='ls -FGh'
alias be='bundle exec'
alias getdocker='eval "$(docker-machine env default)"'
# }}}


# ls colors {{{
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# }}}


# prompt with git branch {{{ 

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt for dark bg
export PS1='\[\e[32m\]\w\[\e[m\]\[\e[33m\]$(parse_git_branch)\[\e[m\] $ '

# Prompt for white bg
# export PS1='\[$(tput setaf 4)\]\w\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] $ '

# git branch name autocompletion
source ~/.git-completion.bash
# }}}
