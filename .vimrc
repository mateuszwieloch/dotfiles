set expandtab           " convert tabs to spaces
set smarttab
set tabstop=2           " 1 tab = 2 spaces
set shiftwidth=2        " shift by 4 spaces (for auto indent)
set noautoindent
set smartindent
set backspace=2         " backspace in insert mode works like normal editor

set incsearch           " show the first match for a search pattern, while you are still typing it
set hlsearch            " highlight all matches for the pattern with a yellow background

colorscheme eddie
syntax on               " syntax highlighting
set number              " line numbers
set showmatch           " show matching paranthesis when writing code
filetype indent on      " activates indenting for files
set nobackup            " get rid of anoying ~file
