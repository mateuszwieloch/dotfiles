# Uber
set -x UBER_HOME "$HOME/Uber"
set -x UBER_OWNER "mwieloch@uber.com"
set -x UBER_LDAP_UID mwieloch

function diffs
  command diffs $argv | rg --invert-match Resigned
end

# Compliance Enforcer
set -gx JAVA_HOME /usr/libexec/java_home -v 1.8

set -x EDITOR vim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc

# generated with https://geoff.greer.fm/lscolors/
# BSD version
set -x LSCOLORS xxBxhxDxfxhxhxhxhxcxcx
# Linux version
set -x LS_COLORS "di=00;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"


# GOPATH
set -gx GOPATH ~/gocode

# PATH
set -l paths \
~/code/dotfiles/bin \
$GOPATH/bin \
~/.poetry/bin \
~/.pyenv/shims \
~/.rbenv/shims \
~/bin \
/usr/local/sbin \
/usr/local/opt/coreutils/bin

for p in $paths
  if not contains $p $PATH; and test -d $p
    # prepend
    set -gx PATH $p $PATH
  end
end

set -g fish_user_paths "/usr/local/opt/mysql@5.7/bin" $fish_user_paths


# CDPATH - list of file and folder name auto-completions triggered with TAB
set -l cdpaths \
. \
~ \
~/code \
~/gocode/src/code.uber.internal \
~/gocode/src/code.uber.internal/*

for p in $cdpaths
  if not contains $p $CDPATH; and test -d $p
    # prepend
    set -gx CDPATH $CDPATH $p
  end
end

# fnm
fnm env --multi | source

# direnv
direnv hook fish | source
