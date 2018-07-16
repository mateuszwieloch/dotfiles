let mapleader="\<space>"

" vim works best with POSIX compatible shell
if &shell =~# 'fish$'
    set shell=sh
endif

syntax on               " Enable syntax highlighting
set regexpengine=1      " Changing regexp engine speeds up syntax highlighting
filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins

set t_Co=256            " force 256 colors terminal



call plug#begin()

" activate vim built-in matchit plugin: % will match beg/end of blocks in many popular languages (eg. html tags)
packadd! matchit

" --- COLOR SCHEMES ---
Plug 'morhetz/gruvbox'

" --- ESSENTIALS ---
Plug '907th/vim-auto-save'
" Features: :AutoSaveToggle to switch on/off
" let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save = 1  " enable AutoSave on Vim startup

" When creating a file in a non-existing directory, ask whether to create it
augroup vim-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

Plug 'tpope/vim-repeat'
" Features: remaps . in a way that plugins can tap into it
" In particular supports vim-commentary and vim-surround

Plug 'tpope/vim-commentary'
" Features: toggle comments
" Usage: gcc toggle comments in a current line
" In visual mode gc to toggle

Plug 'tpope/vim-eunuch'
" :Remove: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Remove, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Find: Run find and load the results into the quickfix list.
" :Locate: Run locate and load the results into the quickfix list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.
" File type detection for sudo -e is based on original file name.
" New files created with a shebang line are automatically made executable.
" New init scripts are automatically prepopulated with /etc/init.d/skeleton.

Plug 'tpope/vim-surround'
" Features: provides mappings to easily delete, change and add surrounding brackets, quotes, etc.
" cs"'  change surrounding " -> '
" ds"   delete surrounding "
" S"    surround in visual mode
" ysiw" surround in word

Plug 'vim-scripts/ReplaceWithRegister'
" Features: gr{motion} to replace with yanked text; grr to replace entire line

Plug 'ntpeters/vim-better-whitespace'
" Features: highlights all trailing whitespaces (spaces and tabs) in red
" :ToggleWhitespace to show/hide whitespace highlighting
" :Enable/DisableWhitespace
" :StripWhitespace to get rid of highlighted stuff
" :ToggleStripWhitespaceOnSave

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
autocmd BufNewFile,BufRead *.snippets
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set noexpandtab |
    \ set autoindent |
    \ set colorcolumn=80 |
    \ set fileformat=unix |

Plug 'Konfekt/FastFold'
" Features: Automatic folding is slow as fuck in vim. This plugin speeds it up
" by computing folds only when needed.


" --- TEXT OBJECTS ---
Plug 'kana/vim-textobj-user'

Plug 'kana/vim-textobj-entire'
" ae       entire file

Plug 'kana/vim-textobj-indent'
" ai ii    around(with whitespace around)/inside indent

Plug 'kana/vim-textobj-line'
" al il    around(with whitespace around)/inside line


" --- SEARCH ---
Plug 'google/vim-searchindex'
" Features: shows how many times does a search pattern occur in the current buffer
" eg: [3/7]  /search_pattern

Plug 'pgdouyon/vim-evanesco'
" Features: Automatically clears search highlight when cursor is moved.
" Draws attention to search under cursor with different highlight group.
" Star search highlights but doesn't move.

Plug 'dyng/ctrlsf.vim'
" Features: Integration for ag/ack/pt/rg (grep replacements). Parses the search result
" and displays the result in a user-friendly format. From 1.9 supports compact view.
" :CtrlSF                          " show results in new window (like Atom)
" :CtrlSF {pattern} /path/to/dir
" :CtrlSF -I {pattern}             " case insensitive
" :CtrlSFToggle
nnoremap <leader>f :CtrlSF<space>
vmap <leader>f <Plug>CtrlSFVwordExec
nnoremap <leader>x :CtrlSFToggle<CR>
let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \ }
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ "vsplit"   : "<C-O>",
    \ }

Plug 'ctrlpvim/ctrlp.vim'
" Features: fuzzy file/buffer/tag finder
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_switch_buffer = ''   " allow opening the same file in multiple splits
let g:ctrlp_max_files = 0        " don't limit number of scanned files
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<leader>o'

" skip space in search string (except some special cases, hence the pattern)
let g:ctrlp_abbrev = { 'abbrevs': [ { 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ', 'expanded': '', 'mode': 'fprz', } ] }

if executable('rg')
  " Use rg over grep in vim
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

  " Use rg in CtrlP. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" --- UI ---
Plug 'jeetsukumaran/vim-filebeagle'
" Features: A simple directory listing utility.
" - to run FileBeagle
" o to open
" v for vertical split
" s for horizontal split
" t to open on a new tab
" po/pv/ps/pt to perform action in background (cursor will stay in filebeagle)
" R refresh directory listing
" gh toggle hidden files
" + to create a file
" f to find within files (using regex)
let g:filebeagle_suppress_keymaps = 1
let g:filebeagle_show_hidden = 1
" let g:filebeagle_buffer_map_movement_keys = 0  " h for folder up, l to open folder
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir


Plug 'itchyny/lightline.vim'
set laststatus=2  " otherwise entire status line is black/blank
set noshowmode    " removes default --INSERT--
let g:lightline = {
    \   'active': {
    \     'left': [ ['mode'], ['filename'], ['readonly'] ],
    \     'right': [ ['linter_warnings', 'linter_errors', 'linter_ok'] ]
    \   },
    \   'component_expand': {
    \     'linter_warnings': 'LightlineLinterWarnings',
    \     'linter_errors': 'LightlineLinterErrors',
    \     'linter_ok': 'LightlineLinterOK'
    \   },
    \   'component_type': {
    \     'readonly': 'error',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \   },
    \ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction


Plug 'w0rp/ale'
" Features: asynchronous lint engine - provides linging while editing a file
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_lint_on_text_changed = 0   " no need, because auto-save + lint_on_save enabled
" nnoremap <leader>ll :ALEToggle<return>
" nnoremap <leader>lf :ALEFix<return>
let g:ale_fixers = {
    \  'ruby': ['rubocop']
    \}


Plug 'yuttie/comfortable-motion.vim'
" Features: makes CTRL-d and CTRL-u scroll smoothly


" --- GIT ---
Plug 'tpope/vim-fugitive'
" Features: git wrapper
" :Gblame

Plug 'airblade/vim-gitgutter'
" Features: shows a git diff in the 'gutter' (lines that were added, removed or modified)
set updatetime=200
" kill mappings starting with <leader>h
nnoremap <Plug>NoGitGutterStageHunk <Plug>GitGutterStageHunk
nnoremap <Plug>NoGitGutterPreviewHunk <Plug>GitGutterPreviewHunk
nnoremap <Plug>NoGitGutterUndoHunk <Plug>GitGutterUndoHunk


" --- PROGRAMMING LANGUAGES ---

" Features: curated bundle of 100+ syntax highlighting plugins
Plug 'sheerun/vim-polyglot'

Plug 'tmhedberg/SimpylFold'
" Features: class/def/imports/docstrings folding for Python
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

Plug 'jeetsukumaran/vim-pythonsense'
" Features: text objects, motions, and semantic location for Python
" Text objects:
" ac ic    around/inside class
" af if    around/inside function or method
" ad id    around/inside multiline docstring
" Motions (overriden in '~/.vim/ftplugin/python/pythonsense-custom.vim')
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1

autocmd FileType python
    \ set textwidth=79 |
    \ set colorcolumn=80 |
    \ set fileformat=unix |
    \ nnoremap <leader>rr :!python %<CR>|


autocmd FileType ruby
    \ set colorcolumn=90 |
    \ set foldmethod=indent |
    \ set nocursorline |
    \ nnoremap <leader>rr :!ruby %<CR>|

let ruby_foldable_groups = 'class def do {'

autocmd BufNewFile,BufRead *.js,*.html,*.css
    \ set colorcolumn=80 |

" TODO: causes Errors as of Vim8.1 due to Python deprecation
" Plug 'valloric/MatchTagAlways'
" " highlights the XML/HTML tags that enclose your cursor location
" let g:mta_filetypes = {
"     \ 'html' : 1,
"     \ 'xhtml' : 1,
"     \ 'xml' : 1,
"     \ 'jinja' : 1,
"     \ 'django' : 1,
"     \ 'htmldjango' : 1,
"     \ 'eruby' : 1,
"     \ 'html.handlebars' : 1,
"     \}

call plug#end()


let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight ALEWarningSign ctermfg=226
highlight ALEErrorSign ctermfg=red

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
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
set scrolloff=4         " keep at least 4 lines below/above the cursor

set cpoptions+=$        " display $ when working with motions

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

set splitbelow          " better splits (new windows appear below and to the right)
set splitright

set nobackup            " get rid of anoying ~file
set nowritebackup
set noswapfile

set foldenable
set foldmethod=indent
set foldlevel=99

set breakindent
set showbreak=\ \  " indent

" --- SEARCH & HIGHLIGHT ---
" --------------------------
set gdefault            " s/<patter>/<replacement> has g flag set by default (replace all occurences in line)
set incsearch           " highlight first match for a search pattern, while still typing it
set hlsearch            " highlight all matches after performing search
set ignorecase          " case insensitive pattern matching
set smartcase           " override ignorecase if pattern contains upcase
" clear search highlights
noremap <bs> :noh<CR>
" in visual mode search for selection with //
vnoremap // y/<C-R>"<CR>

" Highlight all instances of word under cursor, when idle.
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=400
    echo 'Highlight current word: on'
    return 1
  endif
endfunction

" nnoremap <leader>hh :if AutoHighlightToggle()<bar>set hls<Bar>endif<CR>
nnoremap * :keepjumps normal! mi*`i<CR>

highlight Search ctermbg=59 ctermfg=white


" --- BASIC MAPPINGS ---
" ----------------------
nnoremap <CR> :
" use Y to yank the rest of the line - it's a change to unify with <D>, <C>
noremap Y y$
noremap <leader>q :q<cr>
noremap <leader>Q :q!<cr>

nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

" reindent a file
noremap <leader>r mmgg=G`m

" move by visual line (not physical) when wrapping occurs
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$


" --- BUFFERS ---
" ---------------
nnoremap <leader>bs :b#<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bl :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bh :bprev<CR>
nnoremap <leader>bd :bd<CR>

" copy full path to current buffer eg. /full/path/to/file.txt
nnoremap <leader>cf :let @*=expand("%:p")<CR>
" copy full path + line eg. /full/path/to/file.txt:123
nnoremap <leader>cl :let @+=expand("%:p") . ':' . line(".")<CR>
" Copy the entire buffer into the system register
nnoremap <leader>ca ggVG*y

" --- WINDOWS ---
" ---------------
" jump to window
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
" move the current window
noremap <leader>wh <C-W>H
noremap <leader>wj <C-W>J
noremap <leader>wk <C-W>K
noremap <leader>wl <C-W>L

" open empty split
noremap <leader>v :vnew<cr>
noremap <leader>s :new<cr>
" open window with content of current window
noremap <leader>wv <C-W>v
noremap <leader>ws <C-W>s

" make windows equal size
noremap <leader>= <C-W>=

" make current window the only window on the screen
noremap <leader>wo <C-W>o
" exchange windows
nnoremap <leader>wx <C-W>x

" ---- TABS -----
" ---------------
nnoremap <leader>t :tabe<CR>
nnoremap <leader>l :tabn<CR>
nnoremap <leader>h :tabp<CR>

" --- OTHER ---
" -------------
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sc :source %<cr>

" Go Preview
nnoremap gp :!open %:p<cr>
