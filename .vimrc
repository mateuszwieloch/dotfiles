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
Plugin 'jonathanfilip/vim-lucius'
Plugin 'morhetz/gruvbox'


" --- ESSENTIALS ---
Plugin '907th/vim-auto-save'
" Features: :ToggleAutoSave to switch on/off
" let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save = 1  " enable AutoSave on Vim startup

Plugin 'tpope/vim-commentary'
" Features: toggle comments
" Usage: gcc toggle comments in a current line
" In visual mode gc to toggle


Plugin 'sickill/vim-pasta'
" Features: remaps p and P in normal and visual mode to do context aware pasting (indentation of pasted text is adjusted properly to match indentation of surrounding code)


Plugin 'vim-scripts/ReplaceWithRegister'
" Features: gr{motion} to replace with yanked text; grr to replace entire line


Plugin 'tpope/vim-endwise'
" Features: if/unless/class/do/while/def and <enter> will cause insertion of block ending. Works with multiple languages.


Plugin 'kana/vim-textobj-user'
" entire file: ie/ae
Plugin 'kana/vim-textobj-entire'
" indent: ii/ai
Plugin 'kana/vim-textobj-indent'
" line: il/al
Plugin 'kana/vim-textobj-line'


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


Plugin 'milkypostman/vim-togglelist'
" Features: allows to bind a key to toggle the Location List and the Quickfix List
let g:toggle_list_no_mappings = 'true'
nmap <script> <silent> <leader>x :call ToggleQuickfixList()<CR>

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
let g:ctrlp_switch_buffer = ''   " allow opening the same file in multiple splits

" default to regex mode and swap space for .*
let g:ctrlp_regexp = 1
let g:ctrlp_abbrev = { 'gmode': 't', 'abbrevs': [ { 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ', 'expanded': '.*', 'mode': 'pfrz', } ] }

if executable('ag')
  " Use ag over grep in vim
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


Plugin 'bling/vim-airline'
" Features: status line and optional tabline
" settings
set laststatus=2  " status bar (airline) visible all the time
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
" section b: hunks
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline_section_z = '%l/%L'


" --- FISH ---
Plugin 'dag/vim-fish'
" Features: provide support for editing fish scripts


" --- GIT ---
Plugin 'airblade/vim-gitgutter'
" Features: shows a git diff in the 'gutter' (lines that were added, removed or modified)
set updatetime=200
" kill mappings starting with <leader>h
nmap <Plug>NoGitGutterStageHunk <Plug>GitGutterStageHunk
nmap <Plug>NoGitGutterPreviewHunk <Plug>GitGutterPreviewHunk
nmap <Plug>NoGitGutterUndoHunk <Plug>GitGutterUndoHunk


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
Plugin 'pangloss/vim-javascript'
" Features: provides syntax highlighting and improved indentation.


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
colorscheme railscasts
" set background=dark

set encoding=utf-8
set hidden              " switch between buffers without having to save first
set backspace=2         " backspace in insert mode works like normal editor
set clipboard+=unnamed  " use the system paste buffer
set ttimeoutlen=100     " prevent lag before Shift-O

set wildmenu            " Make the command-line completion better
set wildmode=longest:full,full  " First tab: longest matching completion and show full list of matches. Second tab: cycle throught the list.

set mouse=a             " enable mouse use in all modes
set ttymouse=sgr        " xterm2 causes mouse not to work past 220 column, see bug: http://stackoverflow.com/questions/7000960/in-vim-why-doesnt-my-mouse-work-past-the-220th-column

set number              " show gutter with line numbers
set cursorline          " highlight current line
set scrolloff=4         " keep at least 4 lines below/above the cursor

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

set incsearch           " highlight first match for a search pattern, while still typing it
set hlsearch            " highlight all matches after performing search
set ignorecase          " case insensitive pattern matching
set smartcase           " override ignorecase if pattern contains upcase
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
" toggle fold with space
nnoremap <Space> za

set wrap linebreak


" --- BASIC MAPPINGS ---
" ----------------------
" use Y to yank the rest of the line - it's a change to unify with <D>, <C>
map Y y$
imap jk <esc>
map <leader>q :q<cr>
map <leader>w :w<cr>
map <leader>wa :wa<cr>:echo 'All buffers written'<cr>
map <leader>wq :wq<cr>

" reindent a file
map <leader>i mmgg=G`m

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
" copy full path + line eg. /full/path/to/file.txt:123
nnoremap <leader>cl :let @+=expand("%:p") . ':' . line(".")<CR>
" Copy the entire buffer into the system register
nmap <leader>ca ggVG*y

" --- WINDOWS ---
" ---------------
" jump to window
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" move the current window
map <leader>h <C-W>H
map <leader>j <C-W>J
map <leader>k <C-W>K
map <leader>l <C-W>L

" open empty split
map <leader>v :vnew<cr>
map <leader>s :new<cr>
" open split with conent of current window
map <leader>wv <C-W>v
map <leader>ws <C-W>s

" make windows equal size
map <leader>= <C-W>=

" make current window the only window on the screen
map <leader>wo <C-W>o
" close the current window (if it's the last windows in vim, it won't be closed)
map <leader>wc <C-W>c

" go to previous window
map <leader>wp <C-W>p
" cycle through windows (go to bottom, right)
map <leader>ww <C-W><C-W>

" exchange current window with the next one
map <leader>wx <C-W>x
