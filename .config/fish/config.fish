status --is-interactive; and . (rbenv init -|psub)

set -x LSCOLORS gxBxhxDxfxhxhxhxhxcxcx
set -x LS_COLORS "di=36;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"

alias be 'bundle exec'
alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'
alias lsa 'ls -a'
alias lla 'll -a'
alias sl 'll -1'
alias sla 'lla -1'

set -g CDPATH . ~
if test -d ~/code
  set -g CDPATH $CDPATH ~/code
end
