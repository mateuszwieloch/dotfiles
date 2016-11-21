status --is-interactive; and . (rbenv init -|psub)


set -x LSCOLORS gxBxhxDxfxhxhxhxhxcxcx
set -x LS_COLORS "di=36;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"

set -gx PATH $PATH ~/code/dotfiles/bin

set -g CDPATH . ~
if test -d ~/code
  set -g CDPATH $CDPATH ~/code
end

set -U fish_user_abbreviations 'be=bundle exec'

set fish_user_abbreviations $fish_user_abbreviations 'cp=cp -i'
set fish_user_abbreviations $fish_user_abbreviations 'mv=mv -i'
set fish_user_abbreviations $fish_user_abbreviations 'rm=rm -i'

function less
  command less -R
end

function ag
  command ag --pager "less -R" $argv
end

set fish_user_abbreviations $fish_user_abbreviations 'lsa=ls -a'
set fish_user_abbreviations $fish_user_abbreviations 'lla=ll -a'
set fish_user_abbreviations $fish_user_abbreviations 'sl=ll -1'
set fish_user_abbreviations $fish_user_abbreviations 'sla=ll -a -1'

set fish_user_abbreviations $fish_user_abbreviations 'g=git'
set fish_user_abbreviations $fish_user_abbreviations 'gs=git status -s'

set fish_user_abbreviations $fish_user_abbreviations 'py=python3'
