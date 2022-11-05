set -x EDITOR vim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc

if not command -sq exa
  # generated with https://geoff.greer.fm/lscolors/
  # BSD version
  set -x LSCOLORS xxBxhxDxfxhxhxhxhxcxcx
  # Linux version
  set -x LS_COLORS "di=00;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"
end

set --export BAT_STYLE numbers


# PATH
set -l paths \
~/code/mateuszwieloch/dotfiles/bin \
~/bin \
~/.local/bin \
/usr/local/sbin \
/usr/local/opt/coreutils/bin

for p in $paths
  if not contains $p $PATH; and test -d $p
    # prepend
    set -gx PATH $p $PATH
  end
end

# append
set -gx PATH $PATH .


# CDPATH - list of file and folder name auto-completions triggered with TAB
set -l cdpaths . ~ ~/code ~/code/mateuszwieloch

for p in $cdpaths
  if not contains $p $CDPATH; and test -d $p
    # prepend
    set -gx CDPATH $CDPATH $p
  end
end


# load subdirectories of fish/functions
set fish_function_path ~/.config/fish/functions/*/ $fish_function_path

# for GPG to work with Fish
set --export GPG_TTY (tty)

# ssh agent
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

# asdf
switch (uname)
  case Linux
    source ~/.asdf/asdf.fish
  case Darwin
    source /usr/local/opt/asdf/libexec/asdf.fish
  case '*'
    echo 'Error: unrecognized operating system'
end

# fzf
set --export FZF_DEFAULT_COMMAND "fd --type f"
set --export FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set --export FZF_CTRL_T_OPTS "--height='90%' --color=dark,query:green,fg+:white:underline,hl+:bright-green:underline,bg+:black,hl:green:bold,gutter:black --preview 'bat --color=always --number {}'"
set --export FZF_CTRL_R_OPTS "--height='90%' --color=dark,query:green,fg+:white:underline,hl+:bright-green:underline,bg+:black,hl:green:bold,gutter:black"

source ~/.config/fish/local/*.fish
