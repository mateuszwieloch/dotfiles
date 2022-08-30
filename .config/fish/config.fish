set -x EDITOR vim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc

if not which -s exa
  # generated with https://geoff.greer.fm/lscolors/
  # BSD version
  set -x LSCOLORS xxBxhxDxfxhxhxhxhxcxcx
  # Linux version
  set -x LS_COLORS "di=00;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"
end

set --export BAT_STYLE numbers


# PATH
set -l paths \
~/code/dotfiles/bin \
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
set -l cdpaths . ~ ~/code

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

# asdf
source /usr/local/opt/asdf/libexec/asdf.fish

# fzf
set --export FZF_DEFAULT_COMMAND "fd --type f"
set --export FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set --export FZF_CTRL_T_OPTS "--height='90%' --color=dark,query:green,fg+:white:underline,hl+:bright-green:underline,bg+:black,hl:green:bold,gutter:black --preview 'bat --color=always --number {}'"
set --export FZF_CTRL_R_OPTS "--height='90%' --color=dark,query:green,fg+:white:underline,hl+:bright-green:underline,bg+:black,hl:green:bold,gutter:black"

source ~/.config/fish/local/*.fish
