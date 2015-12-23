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


" -------------------
"   PLUGINS CONFIG
" -------------------

" airline visible all the time
set laststatus=2
" show open buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



" ------------------
"   LOOK & FEEL
" ------------------
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
set shiftwidth=2        " shift by 4 spaces (for auto indent)
set noautoindent
set smartindent

set backspace=2         " backspace in insert mode works like normal editor

set incsearch           " show the first match for a search pattern, while you are still typing it
set hlsearch            " highlight all matches for the pattern with a yellow background

set nobackup            " get rid of anoying ~file

" ------------------
"   MAPPINGS
" ------------------

" Maps to make handling windows a bit easier
"noremap <silent> ,h :wincmd h<CR>
"noremap <silent> ,j :wincmd j<CR>
"noremap <silent> ,k :wincmd k<CR>
"noremap <silent> ,l :wincmd l<CR>
"noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Enter adds a blank line without entering the edit mode
nmap <CR> o<Esc>
