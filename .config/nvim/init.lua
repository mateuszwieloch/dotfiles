-- Needs to be set before loading external code so that mappings are correct
vim.g.mapleader = " "

--------------------
-- PLUGIN MANAGER --
--------------------
-- Auto-install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- :Lazy to open the UI.
-- Automatically checks for updates and installs missing plugins.
-- Has support for installing a specific SemVer of a plugin and lockfile `lazy-lock.json`.
-- Can lazy-loade on events, commands, filetypes, and key mappings. UI shows what caused a plugin to be loaded.
require("lazy").setup({
  "wsdjeg/vim-fetch",
  -- Support for the filepath:line format when opening neovim

  -- EDITING --
  -------------
  {
    "kylechui/nvim-surround",
    -- Manipulating surroundind delimiter pairs. Integrates with nvim-treesitter and nvim-treesitter-textobjects.
    -- Default aliases q = `/'/", b = ), B = }, r = ],
    -- f is for function call
    -- yss surrounds the current line
    -- ySS surrounds the current line but adds delimiter pair on lines above and below.
    -- Examples:
    -- ysiw)  yes surround inner word with )
    -- yssf   surround current line with a function call
    -- csq"   change surrounding quotes into "
    -- csth1  change surrounding tag into h1
    -- ds]    delete surrounding ]
    -- viwSb  visual inner work surround with bracket )
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "johnfrankmorgan/whitespace.nvim",
    -- Highlights trailing whitespace. Exposes a function to delete it.
    config = function()
      local whitespace = require("whitespace-nvim")
      whitespace.setup()
      vim.api.nvim_create_user_command("TrimWhitespace", whitespace.trim, {})
    end
  },
  {
    "numToStr/Comment.nvim",
    -- Combine with https://github.com/JoosepAlviste/nvim-ts-context-commentstring if there are nested languages (common in web development)
    -- gcc for line comment
    -- gbc for block comment
    -- gcO open comment above
    -- gcA append comment
    config = function()
      require("Comment").setup()
    end
  },
  {
    "gbprod/substitute.nvim",
    -- New operator and motions to perform quick substitutions and exchanges (not configured).
    -- `s` gets shadowed, so you need to use `cl` to do it now
    config = function()
      vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
      vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
      vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
      vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
    end
  },

  -- COLOR SCHEMES --
  -------------------
  -- Main colorscheme has to be loaded first, which can be achieved with `priority=1000`
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme("tokyonight")

      vim.opt.number = true
      vim.opt.relativenumber = true

      vim.api.nvim_set_hl(0, "LineNr", { fg = "LightGray" })
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "gray" })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "gray28" })

      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "green" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "gold2" })

      -- word diff in buffer
      vim.api.nvim_set_hl(0, "GitSignsAddLnInline", { bg = "DarkGreen" })
      vim.api.nvim_set_hl(0, "GitSignsChangeLnInline", { bg = "gold3" })
      vim.api.nvim_set_hl(0, "GitSignsDeleteLnInline", { bg = "maroon" })
    end
  },

  -- TEXT OBJECTS --
  ------------------
  -- ae  entire file
  -- ie  entire file but skip empty lines at beginning and end
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },
  -- ai ii  around(with whitespace around)/inside indent
  { "kana/vim-textobj-indent", dependencies = { "kana/vim-textobj-user" } },
  -- al il  around(with whitespace around)/inside line
  { "kana/vim-textobj-line", dependencies = { "kana/vim-textobj-user" } },

  -- GIT --
  ---------
  {
    "lewis6991/gitsigns.nvim",
    -- Provides signs in the signcolumn to show changed/added/removed lines.
    -- Mappings for hunks to stage, undo or reset them.
    -- TODO: Integrates with status line and null-fs.
    -- :Gitsigns toggle_word_diff
    -- :Gitsigns diffthis
    -- :Gitsigns toggle_current_line_blame
    -- :Gitsigns toggle_deleted
    -- :Gitsigns preview_hunk or preview_hunk_inline (and then navigate with ]h and [h) to preview changes
    config = function()
      require("gitsigns").setup({
        current_line_blame_opts = {
          delay = 10
        },
        current_line_blame_formatter = '<author> <author_time:%Y-%m-%d> <summary>',
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          vim.keymap.set('n', ']h', function()
            if vim.wo.diff then return ']h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {buffer=bufnr, expr=true})

          vim.keymap.set('n', '[h', function()
            if vim.wo.diff then return '[h' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {buffer=bufnr, expr=true})
        end
      })
    end
  },

  -- STATUS LINE --
  -----------------
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      -- See `:help lualine.txt`
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'tokyonight',
          component_separators = '|',
          section_separators = '',
        },
      }
    end
  },

  -- TELESCOPE --
  ---------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end
  },

  -- HARPOON
  -- Saves marks *per project*
  -- Saves position in file on buffer change and quit/exit
  --{ "https://github.com/ThePrimeagen/harpoon" },

  -- TREESITTER --
  ----------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter-textobjects" },
    config = function()
      -- nvim-ts-autotag - optional extension to autoclose and autorename html tags
      -- p00f/nvim-ts-rainbow - rainbow parantheses
      -- :TSUpdate       Needs to happen when treesitter is upgraded
      -- :TSInstallInfo  A list of all available languages and their installation status
      -- :TSModuleInfo   A table showing what modules are enabled for what languages
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "css", "dockerfile", "fish", "gitcommit", "gitignore", "help", "html", "javascript", "json", "json5", "jsonc", "lua", "markdown", "markdown_inline", "python", "toml", "typescript", "vim", "yaml" },
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,
        },

        indent = {
          enable = true
        },

        -- From the nvim-treesitter/nvim-treesitter-textobjects plugin
        textobjects = {
          -- can also swap parameters
          select = {
            enable = true,
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
              ["ac"] = { query = "@class.outer", desc = "Select outer part of a function" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            }
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = { query = "@function.outer", desc = "Next function start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@function.outer", desc = "Next function end" },
              ["[c"] = { query = "@class.outer", desc = "Next class end" },
            }
          }
        }
      })
    end
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({ mode = 'topline' })
    end
  }
})

vim.opt.clipboard = "unnamedplus"  -- Always use the OS clipboard

vim.opt.undofile = true     -- Store undo history between neovim sessions
vim.opt.writebackup = false -- No tilde files
vim.opt.swapfile = false    -- No .swp files

-- Move by display line (not physical line)
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "0", "g0")
vim.keymap.set("n", "$", "g$")
-- Move cursor to start/end of line
vim.keymap.set({"n", "v"}, "H", "g^")
vim.keymap.set({"n", "v"}, "L", "g$")

-- Copy full path to the current buffer eg. /full/path/to/file.txt
vim.keymap.set("n", "<leader>cf", ":let @+=expand('%:p')<cr>")
-- Copy relative path to the current buffer eg. path/to/file.txt
vim.keymap.set("n", "<leader>cr", ":let @+=expand('%')<cr>")
-- Copy full filepath:line string eg. /full/path/to/file.txt:123
vim.keymap.set("n", "<leader>cl", ":let @+=expand('%:p') . ':' . line('.')<cr>")

----------------------
-- SEARCH & REPLACE --
----------------------
vim.keymap.set("n", "<bs>", ":noh<cr>")

vim.opt.gdefault = true    -- s/<pattern>/<replacement> has g flag set by default
                           -- (g means replace all occurences in line)
vim.opt.ignorecase = true  -- case insensitive pattern matching
vim.opt.smartcase = true   -- override ignorecase if pattern contains upcase

-- double click highlights all occurences of a word
vim.keymap.set("n", "<2-LeftMouse>", "*")

-------------
-- EDITING --
-------------
-- Keep clipboard contents when pasting in visual mode
vim.keymap.set("x", "p", "pgvy")
-- Move line (or selected text) up and down
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
-- Stay in visual mode after indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-------------
-- INDENTS --
-------------
vim.opt.smartindent = true     -- autoindent = same indent as line above; smartindent = autoindent + one extra level of indentation in some cases
vim.opt.expandtab = true       -- convert tabs to spaces
vim.opt.tabstop = 2            -- number of visual spaces per <tab>
vim.opt.softtabstop = 2        -- number of spaces in tab when *editing* (how many will be added or deleted)
vim.opt.shiftwidth = 2         -- >> indents by 2 spaces
vim.opt.shiftround = true      -- >> indents to next multiple of 'shiftwidth'

vim.opt.breakindent = true     -- Wrapped lines will continue visually indented
vim.opt.showbreak="↳ "         -- Extra indent for wrapped lines

-------------
-- WINDOWS --
-------------
-- new windows appear below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Split the window
vim.keymap.set("n", "<A-v>", ":vsplit<cr>")
vim.keymap.set("n", "<A-s>", ":split<cr>")
-- Navigate between vim windows
vim.keymap.set({"n", "v"}, "<A-h>", "<C-W>h")
vim.keymap.set({"n", "v"}, "<A-l>", "<C-W>l")
vim.keymap.set({"n", "v"}, "<A-j>", "<C-W>j")
vim.keymap.set({"n", "v"}, "<A-k>", "<C-W>k")
-- Move the current vim window
vim.keymap.set({"n", "v"}, "<A-H>", "<C-W>H")
vim.keymap.set({"n", "v"}, "<A-L>", "<C-W>L")
vim.keymap.set({"n", "v"}, "<A-J>", "<C-W>J")
vim.keymap.set({"n", "v"}, "<A-K>", "<C-W>K")
-- Make windows equal size
vim.keymap.set({"n", "v"}, "<A-=>", "<C-W>=")
-- Make current window the only window on the screen
vim.keymap.set({"n", "v"}, "<A-o>", "<C-W>o")

-------------
-- BUFFERS --
-------------
-- nnoremap <leader>bs :b#<CR>
-- nnoremap <leader>bn :bnext<CR>
-- nnoremap <leader>bl :bnext<CR>
-- nnoremap <leader>bp :bprev<CR>
-- nnoremap <leader>bh :bprev<CR>
-- nnoremap <leader>bd :bd<CR>

----------
-- TABS --
----------
--TODO
-- nnoremap <leader>tn :tabe<CR>
-- nnoremap <leader>tl :tabn<CR>
-- nnoremap <leader>th :tabp<CR>
-- " move current window to a new tab
-- nnoremap <leader>wt <C-W>T

-----------
-- NETRW --
-----------
-- filetype=netrw
-- +           (custom) create a file
-- <del> or D  delete
-- gh          toggle hidden files
-- i           cycle through the view types
-- q           (custom) return from explorer (go back to the file that was open before)

vim.keymap.set("n", "-", vim.cmd.Explore, { silent = true })
local ftNetrwGroup = vim.api.nvim_create_augroup("ftNetrwGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  group = ftNetrwGroup,
  callback = function()
    vim.keymap.set("n", "q", ":Rexplore<cr>", { buffer=true, nowait=true })
    vim.keymap.set("n", "+", "<Plug>NetrwOpenFile")
  end
})
-- vim.g.netrw_banner = 0

-----------------------
-- LANGUAGE SPECIFIC --
-----------------------
local on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=true})
end
-- JavaScript
local ftJavaScript = vim.api.nvim_create_augroup("ftJavaScript", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  group = ftJavaScript,
  callback = function()
    vim.keymap.set("n", "<leader>r", ":!node %<cr>")
  end
})

-- Python
-- Should call this within a FileType autocmd or put the call in a `ftplugin/<filetype_name>.lua`
local ftPython = vim.api.nvim_create_augroup("ftPython", { clear = true })
vim.api.nvim_create_autocmd("FileType", { -- trigger whenever a filetype is set
  pattern = "python",
  group = ftPython,
  callback = function()
    -- run python3
    vim.keymap.set("n", "<leader>r",
      function()
        if vim.api.nvim_buf_get_name(0) == '' then
          local file_content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false))
          vim.notify(vim.fn.system({"python3", "-c", file_content}))
        else
          vim.notify(vim.cmd.write())
          vim.notify(vim.fn.system({"python3", vim.fn.expand("%")}))
        end
      end,
      { buffer=true }
    )

    vim.opt.colorcolumn = "91"

    -- Pyright
    local bufname = vim.api.nvim_buf_get_name(0) -- 0 means current buffer
    local project_root = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]) or (#bufname == 0 and vim.loop.cwd()) or vim.fs.dirname(bufname)

    -- we can re-run it, because default impl reuses the client when name and root_dir match
    local client_id = vim.lsp.start({
      name = 'Python Pyright',
      cmd = {'pyright-langserver', '--stdio'},
      root_dir = project_root,
      settings = { -- these are language server specific settings
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
          }
        }
      },
      on_attach = on_attach
    })
    vim.lsp.buf_attach_client(0, client_id) -- Notifies LS about changes
  end
})

---------
-- LSP --
---------
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {silent=true})
-- open location list with a list of all issues
vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist, {silent=true})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {silent=true})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {silent=true})



-- vim.cmd("packadd! nvim-lspconfig")
-- lsp = require('lspconfig')
--
-- -- Installed with `brew install pyright`
-- lsp.pyright.setup({
--   --on_attach = function(client, bufnr)
--   --end
-- })
-- :LspInfo

-- vim.cmd("packadd! mason.nvim")
-- vim.cmd("packadd! mason-lspconfig.nvim")
-- -- Autocompletion
-- vim.cmd("packadd! nvim-cmp")
-- vim.cmd("packadd! cmp-buffer")
-- vim.cmd("packadd! cmp-path")
-- vim.cmd("packadd! cmp_luasnip")
-- vim.cmd("packadd! cmp-nvim-lsp")
-- vim.cmd("packadd! cmp-nvim-lua")
-- -- Snippets
-- vim.cmd("packadd! LuaSnip")
-- vim.cmd("packadd! friendly-snippets")
--
-- vim.cmd("packadd! lsp-zero")
--
-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
-- lsp.set_preferences({
--   set_lsp_keymaps = {omit = {'gr'}}
-- })
-- lsp.setup()
-- -- keybindings: https://github.com/VonHeikemen/lsp-zero.nvim#default-keybindings-1

vim.cmd.helptags("ALL")
