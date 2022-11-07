let mapleader="\<space>"


call plug#begin()

" --- COLOR SCHEMES ---
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

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
" :Git blame

Plug 'nvim-lua/plenary.nvim' " required by gitsigns
Plug 'lewis6991/gitsigns.nvim' " can be integrated with null-ls

Plug 'ruanyl/vim-gh-line'
" Features: opens GitHub on the line under the cursor
let g:gh_line_map = '<leader>gh'
let g:gh_line_blame_map = '<leader>gb'
let g:gh_repo_map = '<leader>go'

" Copy link to a clipboard instead of opening a browser:
" let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

let g:gh_github_domain = "git.corp.tanium.com"
let g:gh_use_canonical = 1                        " Use canonical hash in URL in place of branch name

" --- PROGRAMMING LANGUAGES ---

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Rainbow paranthesis module for treesitter.
Plug 'p00f/nvim-ts-rainbow'


Plug 'neovim/nvim-lspconfig'
" Many LSP servers require paramters to run that describe what files to watch, where are executables etc.
" This plugin contains just these configurations, so that it's easier to attach and manage LSP servers.

Plug 'L3MON4D3/LuaSnip'

Plug 'hrsh7th/nvim-cmp'         " the core completion engine
Plug 'hrsh7th/cmp-buffer'       " completes words from the current buffer
Plug 'hrsh7th/cmp-nvim-lua'     " completes lua Neovim functions
" Plug 'hrsh7th/cmp-path'         " completes file paths (NOT YET SETUP)
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip' " completes snippets


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
  ensure_installed = { "bash", "css", "dockerfile", "fish",  "go", "hcl", "html", "javascript", "json", "json5", "jsonc", "lua", "markdown", "python", "ruby", "toml", "typescript", "yaml", "vim" },

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

set completeopt=menu,menuone,noselect

lua <<EOF
  local luasnip = require("luasnip")

  local cmp = require('cmp')
  cmp.setup({
    mapping = {
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

    -- The order of sources (by default) decides priority.i In addition to the name, you can specify:
    -- `keyword_length = 5` the minimum number of characters required before completions from a given source are shown
    -- `max_item_count = 3`
    sources = cmp.config.sources({
      -- this source already knows to only enable itself in the Lua filetype
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'luasnip' },
      { name = 'buffer', keyword_length = 5 },
    }),

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    -- Determines look of the popup menu
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lua = "[LUA]",
          nvim_lsp = "[LSP]",
          path = "[PATH]",
          buffer = "[BUF]",
        })[entry.source.name]

        return vim_item
      end
    },
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  local lsp = require('lspconfig')

  lsp.sumneko_lua.setup {
    on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

      buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

      buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', opts)

      buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

      -- Uses the following highlight groups LspReferenceText LspReferenceRead LspReferenceWrite to highligh symbol under the cursor
      if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
          [[
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]],
          false
        )
      end
    end,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
    capabilities = capabilities
  }

  lsp.terraformls.setup {
    on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

      buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

      buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', opts)

      buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

      -- Uses the following highlight groups LspReferenceText LspReferenceRead LspReferenceWrite to highligh symbol under the cursor
      if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
          [[
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]],
          false
        )
      end
    end,
    capabilities = capabilities
  }
  vim.cmd 'autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()'

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lsp.jsonls.setup {
    -- on_attach function runs inside of every buffer when the LSP gets attached to the buffer
    on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      -- In neovim 0.7 this can change to:
      -- vim.keymap.set('n', '<leader>ld', vim.lsp.buf.hover, {buffer=0}) -- buffer=0 means make keymapping attach to the current buffer
      buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

      -- definition() adds the jump location to tag stack, so it's possible to go back with Ctrl-T (go back through tagstack) or Ctrl-O (go back through jumplist)
      buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      -- jump to the type definition of a variable under cursor
      buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      -- go to implementation - makes particular sense for languages like Go
      buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

      buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      -- Ctrl-q while in Telescope diagnostics puts the diagnostics list into the quickfix window
      buf_set_keymap('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', opts)

      buf_set_keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      -- cool for example for organizing imports
      buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

      -- Uses the following highlight groups LspReferenceText LspReferenceRead LspReferenceWrite to highligh symbol under the cursor
      if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
          [[
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]],
          false
        )
      end
      local schemas = {
      }
    end,
    settings = {
      json = {
        schemas = {
          {
            description = "NPM configuration file",
            fileMatch = {
              "package.json",
            },
            url = "https://json.schemastore.org/package.json",
          }
        },
        {
          description = "TypeScript compiler configuration file",
          fileMatch = {
            "tsconfig.json",
            "tsconfig.*.json",
          },
          url = "https://json.schemastore.org/tsconfig.json",
        },
      },
    },
    capabilities = capabilities,
  }

  lsp.tsserver.setup {
    on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local opts = { noremap=true, silent=true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      -- In neovim 0.7 this can change to:
      -- vim.keymap.set('n', '<leader>ld', vim.lsp.buf.hover, {buffer=0}) -- buffer=0 means make keymapping attach to the current buffer
      buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

      -- definition() adds the jump location to tag stack, so it's possible to go back with Ctrl-T (go back through tagstack) or Ctrl-O (go back through jumplist)
      buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      -- jump to the type definition of a variable under cursor
      buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      -- go to implementation - makes particular sense for languages like Go
      buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

      buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      -- Ctrl-q while in Telescope diagnostics puts the diagnostics list into the quickfix window
      buf_set_keymap('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', opts)

      buf_set_keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      -- cool for example for organizing imports
      buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

      -- Uses the following highlight groups LspReferenceText LspReferenceRead LspReferenceWrite to highligh symbol under the cursor
      if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
          [[
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]],
          false
        )
      end
    end,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }


  require('gitsigns').setup {
    -- extensive options available, see Github repo
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = "▎", numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
      change       = {hl = 'GitSignsChange', text = "▎", numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    },
    keymaps = {
      noremap = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'"},
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'"},

      ['n <leader>gs'] = '<cmd>Gitsigns stage_hunk<CR>',
      ['v <leader>gs'] = ':Gitsigns stage_hunk<CR>',
      ['n <leader>gu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
      ['n <leader>gr'] = '<cmd>Gitsigns reset_hunk<CR>',
      ['v <leader>gr'] = ':Gitsigns reset_hunk<CR>',
      ['n <leader>gR'] = '<cmd>Gitsigns reset_buffer<CR>',
      ['n <leader>gp'] = '<cmd>Gitsigns preview_hunk<CR>',
      ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
      ['n <leader>gS'] = '<cmd>Gitsigns stage_buffer<CR>',
      ['n <leader>gU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
      ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
    },
  }

EOF


set termguicolors       " 24-bit color. Unsupported in Terminal.app
let g:gruvbox_contrast_dark = 'hard' " black background for more contrast
let g:gruvbox_sign_column = 'bg0'    " make sign column color the same as text background
colorscheme gruvbox

" this needs to be set after colorscheme and termguicolors is set
highlight GitSignsAdd guifg=green ctermfg=green
highlight GitSignsChange guifg=yellow ctermfg=yellow
highlight GitSignsDelete guifg=red ctermfg=red
highlight ALEWarningSign ctermfg=226
highlight ALEErrorSign ctermfg=red

" Always show signcolumn, otherwise it would shift the text each time diagnostics appear/disappear.
set signcolumn=yes

set backspace=start,eol,indent  " enable deleting past these (as normal editor would)

" clipboard settings
set clipboard+=unnamedplus  " use the system paste buffer
" paste in visual mode without copying
xnoremap p pgvy
" allow Ctrl-v in insert mode
imap <C-v> <C-r><C-o>+

set ttimeoutlen=100     " prevent lag before Shift-O


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

lua <<EOF
vim.opt.mouse = "a"            -- enable mouse in all modes

vim.opt.smartindent = true     -- autoindent = same indent as line above; smartindent = autoindent + one extra level of indentation in some cases
vim.opt.expandtab = true       -- convert tabs to spaces
vim.opt.tabstop = 2            -- number of visual spaces per <tab>
vim.opt.softtabstop = 2        -- number of spaces in tab when *editing* (how many will be added or deleted)
vim.opt.shiftwidth = 2         -- >> indents by 2 spaces
vim.opt.shiftround = true      -- >> indents to next multiple of 'shiftwidth'
EOF

set history=1000        " command history
set autoread            " autoread files that have changed outside of vim

set lazyredraw          " speeds up vim. A lot!
set ttyfast



lua <<EOF
vim.opt.splitbelow = true   -- new windows appear below and to the right
vim.opt.splitright = true
vim.opt.writebackup = false -- no tilde files
vim.opt.swapfile = false    --
EOF

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
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv


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

" move current window to a new tab
nnoremap <leader>wt <C-W>T


" ---- TABS -----
" ---------------
nnoremap <leader>tn :tabe<CR>
nnoremap <leader>tl :tabn<CR>
nnoremap <leader>th :tabp<CR>

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
