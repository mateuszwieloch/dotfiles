# ENV VARIABLES
set -x UBER_HOME "$HOME/Uber"
set -x UBER_OWNER "mwieloch@uber.com"
set -x UBER_LDAP_UID mwieloch
set -x VAGRANT_DEFAULT_PROVIDER aws
set -x VAGRANTNAME club-180406

set -x EDITOR vim


set -gx GOPATH $HOME/gocode

# PATH
set -l paths \
$HOME/bin \
$HOME/.cargo/bin \
$GOPATH/bin \
~/code/dotfiles/bin \
(pyenv root)/shims \
/usr/local/sbin # uber specific

for p in $paths
  if not contains $p $PATH; and test -d $p
    # prepend
    set -gx PATH $p $PATH
  end
end

# CDPATH
set -g CDPATH . ~
# if ~/code exists add all subdirectories of ~/code to fold autocomplete list triggered with TAB
if test -d ~/code
  set -g CDPATH $CDPATH ~/code
end

set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc

eval (/usr/local/bin/python -m virtualfish auto_activation)

set -U fish_user_abbreviations 'be=bundle exec'

set fish_user_abbreviations $fish_user_abbreviations 'cp=cp -i'
set fish_user_abbreviations $fish_user_abbreviations 'mv=mv -i'
set fish_user_abbreviations $fish_user_abbreviations 'rm=rm -i'

function less
  command less -R
end

function https
  command http --default-scheme=https $argv
end

function timestamp $argv
  command date "+%Y%m%d%H%M%S" $argv
end

function cn
  set CN_PATH (/usr/local/bin/change-node run)
  set final (echo $CN_PATH|cut -d ':' -f1)
  if not contains $final $PATH
    # prepend
    set -gx PATH $final $PATH
  end
end

# ls
function ls
  # -F append indicator to entries /=directory, *=executable, @=symbolic link
  # -h humanly readable file sizes
  command ls -Fh $argv
end
set fish_user_abbreviations $fish_user_abbreviations 'lsa=ls -A'
set fish_user_abbreviations $fish_user_abbreviations 'lla=ll -A'
set fish_user_abbreviations $fish_user_abbreviations 'sl=ll -1'
set fish_user_abbreviations $fish_user_abbreviations 'sla=ll -1 -A'
# generated with https://geoff.greer.fm/lscolors/
# BSD
set -x LSCOLORS xxBxhxDxfxhxhxhxhxcxcx
# Linux
set -x LS_COLORS "di=00;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"

# tree
function tree
  command tree -F $argv
end


set fish_user_abbreviations $fish_user_abbreviations 'py=python3'
set -g fish_user_paths "/usr/local/opt/node@8/bin" $fish_user_paths
