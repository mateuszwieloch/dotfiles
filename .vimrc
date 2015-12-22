set nocompatible              " not vi compatible
filetype off                  " required


" -------------------
"  VUNDLE
" -------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDtree
Plugin 'scrooloose/nerdTree'

" vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" vim-airline
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" -------------------
"   PLUGINS CONFIG
" -------------------

" airline visible all the time
set laststatus=2
" show open buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1




set expandtab           " convert tabs to spaces
set smarttab
set tabstop=2           " 1 tab = 2 spaces
set shiftwidth=2        " shift by 4 spaces (for auto indent)
set noautoindent
set smartindent
set backspace=2         " backspace in insert mode works like normal editor

set incsearch           " show the first match for a search pattern, while you are still typing it
set hlsearch            " highlight all matches for the pattern with a yellow background

colorscheme xoria256
syntax on               " syntax highlighting
set number              " line numbers
set showmatch           " show matching paranthesis when writing code
filetype indent on      " activates indenting for files
set nobackup            " get rid of anoying ~file
