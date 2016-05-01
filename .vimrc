let mapleader=","

" vim works best with POSIX compatible shell
if &shell =~# 'fish$'
    set shell=sh
endif

" activate vim built-in matchit plugin: % will match beg/end of blocks in many popular languages (eg. html tags)
runtime macros/matchit.vim


" --- VUNDLE ---
" -------------- {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Features: use Vundle to manage its own version

" --- COLOR SCHEMES ---
Plugin 'jpo/vim-railscasts-theme'
" Plugin 'jonathanfilip/vim-lucius'
" Plugin 'morhetz/gruvbox'


" --- ESSENTIALS ---
Plugin 'tpope/vim-commentary'
" Features: toggle comments
" Usage: gcc toggle comments in a current line
" In visual mode gc to toggle


Plugin 'sickill/vim-pasta'
" Features: remaps p and P in normal and visual mode to do context aware pasting (indentation of pasted text is adjusted properly to match indentation of surrounding code)


Plugin 'tpope/vim-endwise'
" Features: if/unless/class/do/while/def and <enter> will cause insertion of block ending. Works with multiple languages.


Plugin 'tpope/vim-surround'
" Features: provides mappings to easily delete, change and add surrounding brackets, quotes, etc.
" cs"'  change surrounding " -> '
" ds"   delete surrounding "
" S"    surround in visual mode
" ysiw" surround in word


Plugin 'ntpeters/vim-better-whitespace'
" Features: highlights all trailing whitespaces (spaces and tabs) in red
" :ToggleWhitespace to show/hide whitespace highlighting
" :StripWhitespace to get rid of highlighted stuff


Plugin 'rking/ag.vim'
" Features: This plugin allows to run ag (aka. the silver searcher, grep replacement) from vim, and shows the results in a Quickfix window.
" :Ag [options] {pattern} [{directory}]
" by default start searching from root of project, not cwd
let g:ag_working_path_mode="r"
map <leader>a :Ag!<space>


" --- UI ---
Plugin 'jeetsukumaran/vim-filebeagle'
" Features: it's a simple directory listing utility. It's not filesystem manager and it doesn't support grepping/finding text.
" - to run FileBeagle
" o to open
" v for vertical split
" s for horizontal split
" t to open on a new tab
" po/pv/ps/pt to perform action in background
" R refresh directory listing
" gh toggle hidden files
" + to create a file


Plugin 'ctrlpvim/ctrlp.vim'
" Features: fuzzy file/buffer/tag finder
let g:ctrlp_working_path_mode = 'rc'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


Plugin 'bling/vim-airline'
" Features: status line and optional tabline
" settings
set laststatus=2  " status bar (airline) visible all the time
" let g:airline#extensions#tabline#enabled = 1  " show open buffers
let g:airline_powerline_fonts = 1


" --- FISH ---
Plugin 'dag/vim-fish'
" Features: provide support for editing fish scripts


" --- GIT ---
Plugin 'airblade/vim-gitgutter'
" Features: shows a git diff in the 'gutter' (lines that were added, removed or modified)
set updatetime=200


" --- PYTHON ---
let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


" --- RUBY ---
Plugin 'vim-ruby/vim-ruby'
" vim-ruby upgrade (comes built-in with vim)
" Features: provides syntax highlight, auto-indentation and code-completion support
" Usage: <C-x><C-o> to autocomplete, <C-n> or <C-p> to navigate list, <C-y> to accept

" save & run current file
nmap <leader>rr :w<CR>:!ruby %<CR>


" --- WEB ---
Plugin 'mustache/vim-mustache-handlebars'

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


call vundle#end()            " required
" }}}



syntax on               " Enable syntax highlighting
filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

set t_Co=256            " force 256 colors terminal
set background=dark
colorscheme railscasts

set encoding=utf-8
set hidden              " switch between buffers without having to save first
set backspace=2         " backspace in insert mode works like normal editor
set clipboard+=unnamed  " use the system paste buffer
set ttimeoutlen=100     " prevent lag before Shift-O

set wildmenu            " Make the command-line completion better
set wildmode=longest:full,full  " First tab: longest matching completion and show full list of matches. Second tab: cycle throught the list.

set mouse=a             " enable mouse use in all modes
set ttymouse=xterm2     " set it to name of terminal that supports mouse codes

set number              " show line numbers
set cursorline          " highlight current line

set smartindent         " autoindent = same indent as line above; smartindent = autoindent + one extra level of indentation in some cases
set expandtab           " convert tabs to spaces
set tabstop=2           " number of visual spaces per <tab>
set softtabstop=2       " number of spaces in tab when *editing* (how many will be added or deleted)
set shiftwidth=2        " >> indents by 2 spaces
set shiftround          " >> indents to next multiple of 'shiftwidth'

set history=1000        " command history
set autoread            " autoread files that have changed outside of vim

set lazyredraw          " speeds up vim. A lot!
set ttyfast

set incsearch           " show the first match for a search pattern, while you are still typing it
set hlsearch            " highlight all matches for the pattern
set ignorecase          " ignores case sensitivity when carrying out a search on a document
set smartcase
" clear search highlights
map \ :noh<CR>

set splitbelow          " better splits (new windows appear below and to the right)
set splitright

set nobackup            " get rid of anoying ~file
set nowritebackup
set noswapfile

set foldenable
set foldmethod=indent
set foldlevel=99
set foldlevelstart=10    " show most folds by default
" toggle fold with space
nnoremap <Space> za

set wrap linebreak


" --- BASIC MAPPINGS ---
" ----------------------
" use Y to yank the rest of the line - it's a change to unify with <D>, <C>
map Y y$
imap jk <esc>
map <leader>v :vs<cr>
map <leader>s :sp<cr>

" move by visual line (not physical) when wrapping occurs
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$


" --- BUFFERS ---
" ---------------
nmap <leader>bs :b#<CR>
nmap <leader>bn :bnext<CR>
nmap <C-n> :bnext<CR>
nmap <leader>bd :bd<CR>

" copy full path to current buffer eg. /full/path/to/file.txt
nnoremap <leader>cf :let @*=expand("%:p")<CR>


" --- WINDOWS ---
" ---------------
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" split current window in two
map <leader>wv <C-W>v
" split current window in two
map <leader>ws <C-W>s

" make current window the only window on the screen
map <leader>wo <C-W>o
" close the current window (if it's the last windows in vim, it won't be closed)
map <leader>wc <C-W>c

" go to previous window
map <leader>wp <C-W>p
" cycle through windows (go to bottom, right)
map <leader>ww <C-W><C-W>

" move the current window to left/bottom/top/right
map <leader>wh <C-W>H
map <leader>wj <C-W>J
map <leader>wk <C-W>K
map <leader>wl <C-W>L
" exchange current window with the next one
map <leader>wx <C-W>x
