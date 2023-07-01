set -x EDITOR vim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc


# PATH
set -l paths \
~/code/mateuszwieloch/dotfiles/bin \
~/bin \
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

# load files in fish/local
source ~/.config/fish/local/*.fish

# for GPG to work with Fish
set --export GPG_TTY (tty)

# ssh agent
if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

# fzf
set --export FZF_DEFAULT_COMMAND "fd --type f"
set --export FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set --export FZF_CTRL_T_OPTS "--height='90%' --color=dark,query:green,fg+:white:underline,hl+:bright-green:underline,bg+:black,hl:green:bold,gutter:black --preview 'bat --color=always --number {}'"
set --export FZF_CTRL_R_OPTS "--height='90%' --color=dark,query:green,fg+:white:underline,hl+:bright-green:underline,bg+:black,hl:green:bold,gutter:black"

source ~/.config/fish/local/*.fish

# Detect if Homebrew was installed on Linux and source shell env
test -d /home/linuxbrew/.linuxbrew && eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)


if command -sq exa
  # Overall syntax: https://the.exa.website/docs/colour-themes
  # Color codes: https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit

  # 38;5  means select foreground color
  # 48;5  means select background color
  # next goes 8bit color code
  # next can be style 1=bold 4=underline
  # combined example: EXA_COLORS "*.xyz=38;5;14;1"

  # di = directories
  set -x EXA_COLORS (string join ':' \
    "di=38;5;37;1" \
    "*.js=38;5;220"
  )
else
  # generated with https://geoff.greer.fm/lscolors/
  # BSD version
  set -x LSCOLORS xxBxhxDxfxhxhxhxhxcxcx
  # Linux version
  set -x LS_COLORS "di=00;40:ln=1;31;40:so=37;40:pi=1;33;40:ex=35;40:bd=37;40:cd=37;40:su=37;40:sg=37;40:tw=32;40:ow=32;40:"
end

set --export BAT_STYLE numbers
set --export BAT_THEME "Monokai Extended"

function storePathForWindowsTerminal --on-variable PWD
  if test -n "$WT_SESSION"
    printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
  end
end
