let mapleader="\<space>"


call plug#begin()

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

Plug 'numToStr/Comment.nvim'
" Features: supports treesitter, nested languages and intuitive motions

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

Plug 'bogado/file-line'
" Features: Plugin for vim to enable opening a file on a given line
" Vanila vim:       vi some/file.py +123
" With this plugin: vi some/file.py:123

Plug 'ntpeters/vim-better-whitespace'
" Features: highlights all trailing whitespaces (spaces and tabs) in red
" :ToggleWhitespace to show/hide whitespace highlighting
" :Enable/DisableWhitespace
" :StripWhitespace to get rid of highlighted stuff
" :ToggleStripWhitespaceOnSave


" --- TEXT OBJECTS ---
Plug 'kana/vim-textobj-user'

Plug 'kana/vim-textobj-entire'
" ae       entire file

Plug 'kana/vim-textobj-indent'
" ai ii    around(with whitespace around)/inside indent

Plug 'kana/vim-textobj-line'
" al il    around(with whitespace around)/inside line


" --- SEARCH ---
set gdefault            " s/<pattern>/<replacement> has g flag set by default
                        " (g means replace all occurences in line)
set incsearch           " highlights first match while still typing search term
set hlsearch            " highlights all matches after performing search
set ignorecase          " case insensitive pattern matching
set smartcase           " override ignorecase if pattern contains upcase
" double click highlights all occurences of word
map <2-LeftMouse> *
" in visual mode search for selection with //
vnoremap // y/<C-R>"<CR>

" backspace to remove search highlight
nnoremap <bs> :noh<cr>

highlight Search ctermbg=59 ctermfg=white

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>o :FZF<cr>
nnoremap <leader>f :Rg<space>
" yank word under cursor into z buffer; then execute Rg on contents of z buffer
nnoremap <leader>F "zyiw:exe ":Rg ".@z""<cr>

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
set noruler
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


Plug 'yuttie/comfortable-motion.vim'
" Features: makes CTRL-d and CTRL-u scroll smoothly
let g:comfortable_motion_friction = 250.0
let g:comfortable_motion_air_drag = 0.0


" --- GIT ---
au FileType gitcommit setlocal formatoptions=tn colorcolumn=73

Plug 'tpope/vim-fugitive'
" Features: git wrapper
" :Gblame

Plug 'airblade/vim-gitgutter'
" Features: shows a git diff in the 'gutter' (lines that were added, removed or modified)
set updatetime=200
let g:gitgutter_map_keys = 0   " kill all mappings


" --- PROGRAMMING LANGUAGES ---

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Rainbow paranthesis module for treesitter.
Plug 'p00f/nvim-ts-rainbow'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Intellisense engine for Vim8/Neovim with full language protocol support

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" TODO
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" TODO: Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" TODO: Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

Plug 'jeetsukumaran/vim-pythonsense'
" Features: text objects, motions, and semantic location for Python
" Text objects:
" ac ic    around/inside class
" af if    around/inside function or method
" ad id    around/inside multiline docstring
" Motions (overriden in '~/.vim/ftplugin/python/pythonsense-custom.vim')
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1

Plug 'davidhalter/jedi-vim'
" Features: Completion for Python!
" pip install jedi  # to make it work
" <ctrl-space> to force completion
" Cmd-d or <leader>d to go to definiton

" disable autocompleting of import when starting import statement
let g:jedi#smart_auto_mappings = 0
nmap <leader>d :call jedi#goto()<cr>

autocmd FileType python
    \ set textwidth=90 |
    \ set colorcolumn=91 |
    \ set fileformat=unix |
    \ nnoremap <leader>r :!python %<CR>|

nnoremap <leader>un :cnext<CR>
nnoremap <leader>up :cprevious<CR>
nnoremap <leader>uc :cclose<CR>

autocmd FileType ruby
    \ set colorcolumn=90 |
    \ set foldmethod=indent |
    \ set nocursorline |
    \ nnoremap <leader>r :!ruby %<CR>|

let ruby_foldable_groups = 'class def do {'

autocmd BufNewFile,BufRead *.js,*.html,*.css
    \ set colorcolumn=80 |

autocmd FileType javascript
    \ nnoremap <leader>r :!node %<CR>|

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

" needs to be after plug#end because nvim-treesitter depends on files in
" runtime path, which load after the end
lua <<EOF

require('Comment').setup({
  ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  ---@type table
  mappings = {
      ---Operator-pending mapping
      ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
      basic = true,
      ---Extra mapping
      ---Includes `gco`, `gcO`, `gcA`
      extra = true,
      ---Extended mapping
      ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extended = false,
  },
})

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "fish", "hcl", "lua", "typescript", "vim" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,

    -- List of languages that will be disabled
    disable = {}
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
EOF

set termguicolors       " 24-bit color. Unsupported in Terminal.app
let g:gruvbox_contrast_dark = 'hard' " black background for more contrast
let g:gruvbox_sign_column = 'bg0'    " make sign column color the same as text background
colorscheme gruvbox
highlight ALEWarningSign ctermfg=226
highlight ALEErrorSign ctermfg=red

" Always show signcolumn, otherwise it would shift the text each time
" diagnostics from ALE or Coc.nvim appear/disappear.
set signcolumn=yes

set backspace=start,eol,indent  " enable deleting past these (as normal editor would)

" clipboard settings
set clipboard+=unnamedplus  " use the system paste buffer
" paste in visual mode without copying
xnoremap p pgvy
" allow Ctrl-v in insert mode
imap <C-v> <C-r><C-o>+

set ttimeoutlen=100     " prevent lag before Shift-O

set mouse=a             " enable mouse use in all modes
if !has('nvim')
  set ttymouse=sgr        " xterm2 causes mouse not to work past 220 column, see bug: http://stackoverflow.com/questions/7000960/in-vim-why-doesnt-my-mouse-work-past-the-220th-column
endif

set number              " show gutter with line numbers
set cursorline          " highlight current line
" Change cursor shape in various modes
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
if $TERM =~ "xterm-kitty"
    let &t_SI.="\e[5 q" " Vertical bar in insert mode
    let &t_EI.="\e[1 q" " Block in normal mode
    let &t_ut=''
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
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99

set breakindent
set showbreak=\ \  " indent


" --- HELP ---
" ------------

" better mappings to navigate helpgrep
nmap <silent> <RIGHT>         :cnext<cr>
nmap <silent> <RIGHT><RIGHT>  :cnfile<cr>
nmap <silent> <LEFT>          :cprev<cr>
nmap <silent> <LEFT><LEFT>    :cpfile<cr>

" show help in a new tab
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

function! HelpInNewTab ()
    if &buftype == 'help'
        " convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction


" --- MOVING AROUND THE FILE ---
" ------------------------------
" move by display line (not physical) when wrapping occurs
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap $ g$

nnoremap H g^
vnoremap H g^
nnoremap L g$
vnoremap L g$


" --- EDITING ---
" ---------------

" stay in visual mode after indenting
vnoremap > >gv
vnoremap \< <gv

" move line (or selected text) up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


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
" copy relative path to current buffer eg. path/to/file.txt
nnoremap <leader>cr :let @+=expand("%")<CR>
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

" split window
noremap <leader>v :vsplit<cr>
noremap <leader>s :split<cr>
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

" ---- UNDO ----
" --------------
set undofile
" Note: undodir must already exist!
set undodir=~/.vim/undodir


" --- OTHER ---
" -------------
noremap <leader>q :q<cr>
noremap <leader>Q :q!<cr>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sc :source %<cr>

" Go Preview
nnoremap gp :!open %:p<cr>
