set nocompatible              " not vi compatible
filetype off                  " required


" --- VUNDLE ---{{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" NERDtree
Plugin 'scrooloose/nerdTree'

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'

" vim-airline
Plugin 'bling/vim-airline'

" vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
# }}}


" --- PLUGINS CONFIG ---{{{

" status bar (airline) visible all the time
set laststatus=2
" show open buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}


" --- LOOK & FEEL ---{{{

set t_Co=256            " force 256 colors terminal
colorscheme xoria256
syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set wildmenu            " Make the command-line completion better

set number              " line numbers
set cursorline          " highlight current line
set showmatch           " show matching paranthesis when writing code

set expandtab           " convert tabs to spaces
set smarttab
set tabstop=2           " 1 tab = 2 spaces
set shiftwidth=2        " shift by 2 spaces (for auto indent)
set noautoindent
set smartindent

set autoread            " autoread files that have changed outside of vim

set history=1000        " command history

set backspace=2         " backspace in insert mode works like normal editor

set incsearch           " show the first match for a search pattern, while you are still typing it
set hlsearch            " highlight all matches for the pattern with a yellow background

set ignorecase          " ignores case sensitivity when carrying out a search on a document
set smartcase 

set splitbelow          " better splits (new windows appear below and to the right)
set splitright

set nobackup            " get rid of anoying ~file
set nowritebackup
set noswapfile
" }}}


" --- MAPPINGS ---{{{

" Enter adds a blank line without entering the edit mode
nmap <CR> o<Esc>
# }}}
