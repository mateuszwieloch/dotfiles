set -x EDITOR vim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc

# generated with https://geoff.greer.fm/lscolors/
# BSD version
set -x LSCOLORS xxBxhxDxfxhxhxhxhxcxcx
# Linux version
set -x LS_COLORS "di=00;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"


# PATH
set -l paths \
~/code/dotfiles/bin \
~/.cargo/bin \
~/.poetry/bin \
~/.pyenv/shims \
~/.rbenv/shims \
~/bin \
~/.local/bin \
/usr/local/sbin \
/usr/local/opt/coreutils/bin \
~/.okta/bin \
~/code/tanium-cloud/SaaS-CustomerEnvironment/cli \
~/code/tanium-cloud/sre-tools/bin

for p in $paths
  if not contains $p $PATH; and test -d $p
    # prepend
    set -gx PATH $p $PATH
  end
end

# append
set -gx PATH $PATH .


# CDPATH - list of file and folder name auto-completions triggered with TAB
set -l cdpaths \
. \
~ \
~/code \
~/code/tanium-cloud \
~/code/tanium

for p in $cdpaths
  if not contains $p $CDPATH; and test -d $p
    # prepend
    set -gx CDPATH $CDPATH $p
  end
end


# fnm
fnm env | source

# for GPG to work with Fish
set --export GPG_TTY (tty)

# PYTHON
# pipx completions
register-python-argcomplete --shell fish pipx | source

# Tanium - for metrics-all-in-one-env
set --export TS_IP '192.168.56.80'
