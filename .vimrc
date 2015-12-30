set nocompatible              " not vi compatible
filetype off                  " required
set clipboard+=unnamed " use the system paste buffer

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
" }}}


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

set foldmethod=marker
" }}}


" --- MAPPINGS ---{{{
let mapleader=","

" Enter adds a blank line without entering the edit mode
nmap <CR> o<Esc>

" Buffers navigation
nmap <C-e> :b#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" move between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l  

nnoremap <CR> :nohlsearch<cr>

nnoremap <Space> za

" use Y to yank the rest of the line
map Y y$

" edit vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
"
" }}}
