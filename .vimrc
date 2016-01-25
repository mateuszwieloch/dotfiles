set nocompatible        " not vi compatible

" --- VUNDLE ---{{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Use vundle to manage plugins
Plugin 'VundleVim/Vundle.vim'


Plugin 'tmhedberg/matchit'
" Features: % matches not only brackets, but also beg/end of blocks in many popular languages


Plugin 'tomtom/tcomment_vim'
" Features: toggle comments
" Usage: gcc toggle comments in a current line
" In visual mode gc to toggle

Plugin 'tpope/vim-surround'
" Features: provides mappings to easily delete, change and add surrounding brackets, quotes, etc.

Plugin 'ntpeters/vim-better-whitespace'
" Features: highlights all trailing whitespaces (spaces and tabs)
" :ToggleWhitespace to show/hide whitespace highlighting
" :StripWhitespace to get rid of highlighted stuff

Plugin 'scrooloose/nerdTree'
" Features: explore filesystem as a tree. Open files and folders.


Plugin 'ctrlpvim/ctrlp.vim'
" Features: fuzzy file/buffer/tag finder


Plugin 'bling/vim-airline'
" Features: status line and optional tabline
" settings
set laststatus=2  " status bar (airline) visible all the time
let g:airline#extensions#tabline#enabled = 1  " show open buffers
let g:airline_powerline_fonts = 1


Plugin 'scrooloose/syntastic'
" Features: sends files to external syntax checkers (eg. Rubocop) and displays errors to the user.
" Usage: :h syntastic
" :SyntasticInfo - show list of checkers available for current filetype
" :SyntasticCheck - manually check right now
" :SyntasticReset - clear errors
" :SyntasticToggleMode - toggle between manual and automatic (on buffer open and write)
" :lclose - close location-list window
" :lopen
" :ll     - highlight current warning in code
" :lnext  - highlight next warning
" :lprev
" mappings
nmap <leader>ss :SyntasticCheck<cr>
nmap <leader>sr :SyntasticReset<cr>
nmap <leader>st :SyntasticToggleMode<cr>
nmap <leader>sc :lclose<cr>
nmap <leader>so :lopen<cr>
nmap <leader>sl :ll<cr>
nmap <leader>sn :lnext<cr>
nmap <leader>sp :lprevious<cr>
" settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']


Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Features: syntax highlight, matching rules and mappings for Markdown


Plugin 'vim-ruby/vim-ruby'
" vim-ruby upgrade (comes built-in with vim)
" Features: provides syntax highlight, auto-indentation and code-completion support
" Usage: <C-x><C-o> to autocomplete, <C-n> or <C-p> to navigate list, <C-y> to accept


Plugin 'thoughtbot/vim-rspec'
let g:rspec_command = ":w | !clear && bundle exec rspec {spec}"

Plugin 'keith/rspec.vim'

" Uncomment after adding rails.vim plugin. These 2 lines will enable rspec highlight in rspec files outside of rails projects.
" autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
" highlight def link rubyRspec Function


Plugin 'tpope/vim-endwise'
" Features: automatic insertion of end after if/unless/class/do/while/def blocks
" Usage: press <return> at the end of block

Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
" Features: Adds two new text objects: ar (around ruby block) and ir (inside of a ruby block)


" Other useful plugins:
" vim-fugitive - git for vim
" vim-rails
" vim-cucumber
" vim-haml
" vim-snipmate - for snippets
" tcomment-vim - toggle comments
" supertab - press tab to complete a word/function name/class name/keyword
" auto-pair - insert closing pair of ([{ automatically

call vundle#end()            " required
" }}}

set t_Co=256            " force 256 colors terminal
colorscheme molokai
let g:rehash256 = 1     " adjust molokai for 256 colors terminal
set background=dark

syntax on               " Enable syntax highlighting
filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

set clipboard+=unnamed  " use the system paste buffer
set wildmenu            " Make the command-line completion better
set wildmode=longest:full,full  " First tab: longest matching completion and show full list of matches. Second tab: cycle throught the list.

set number              " show line numbers
set cursorline          " highlight current line
" set showcmd             " Affects bottom bar. in normal mode: show command as you type it; in visual mode: show number of selected lines

set backspace=2         " backspace in insert mode works like normal editor
" set cpo+=$              " when changing text, don't erase, display $ at the end of the changed text

set tabstop=2           " number of visual spaces per <tab>
set expandtab           " convert tabs to spaces
set softtabstop=2       " number of spaces in tab when *editing* (how many will be added or deleted)
set smarttab
set shiftwidth=2        " shift by 2 spaces (for auto indent)
set noautoindent
set smartindent

set history=1000        " command history
set autoread            " autoread files that have changed outside of vim
set lazyredraw          " speeds up vim. A lot!
set ttyfast

set incsearch           " show the first match for a search pattern, while you are still typing it
set hlsearch            " highlight all matches for the pattern
set ignorecase          " ignores case sensitivity when carrying out a search on a document
set smartcase
" clear highlights with escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

set splitbelow          " better splits (new windows appear below and to the right)
set splitright

set nobackup            " get rid of anoying ~file
set nowritebackup
set noswapfile

set foldenable
set foldmethod=indent
set foldlevelstart=10    " show most folds by default
" toggle fold with space
nnoremap <Space> za

" no wrapping
set textwidth=0
set wrapmargin=0
set formatoptions-=t

" mouse
set mouse=a             " enable mouse use in all modes
set ttymouse=xterm2     " set it to name of terminal that supports mouse codes



let mapleader=","

" buffers navigation
nmap <leader>bs :b#<CR>
nmap <leader>bn :bnext<CR>
nmap <C-n> :bnext<CR>
nmap <leader>bd :bd<CR>

" copy full path to current buffer eg. /full/path/to/file.txt
nnoremap <leader>cf :let @*=expand("%:p")<CR>

" windows navigation
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <leader>wh <C-W>H
map <leader>wj <C-W>J
map <leader>wk <C-W>K
map <leader>wl <C-W>L
map <leader>wo <C-W>o
map <leader>wx <C-W>x
map <leader>wv <C-W>v
map <leader>wc <C-W>c
map <leader>wp <C-W>p
map <leader>ww <C-W><C-W>



" use Y to yank the rest of the line - it's a change to unify with <D>, <C>
map Y y$

" ruby
nmap <leader>rr :w<CR>:!ruby %<CR>

" rspec
map <leader>tf :call RunCurrentSpecFile()<CR>
map <leader>ts :call RunNearestSpec()<CR>
map <leader>tl :call RunLastSpec()<CR>
map <leader>ta :call RunAllSpecs()<CR>

" edit vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
