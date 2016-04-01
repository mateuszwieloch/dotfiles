# this file should contain stuff specific to bash
eval "$(rbenv init -)"

# aliases {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ll='ls -l'
alias lla='ls -la'
alias ls='ls -FGh'
alias tree='tree -FC'
alias be='bundle exec'
alias rspec='be rspec'
alias rake='be rake'
alias getdocker='eval "$(docker-machine env default)"'
# }}}


# ls colors {{{
export CLICOLOR=1
# ls on Mac uses BSD-style LSCOLORS variable
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# tree uses Linux LS_COLORS variable that has different syntax than LSCOLORS
export LS_COLORS="di=36;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"
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

# increase number of allowed processes. Node likes to open tons of files at once, hence a need for the increase.
ulimit -n 4096

export PATH="node_modules/.bin:$PATH"
