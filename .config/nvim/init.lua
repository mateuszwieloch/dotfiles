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

  "lambdalisue/suda.vim",
  -- :SudaWrite to write read-only file


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
      vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
      vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
      vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
      vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })
    end
  },
  {
    "echasnovski/mini.move",
    -- Move current/selected line(s)
    config = function()
      require('mini.move').setup({
        mappings = {
          -- Move visual selection
          left = '',
          right = '',
          down = '<C-j>',
          up = '<C-k>',

          -- Move current line in Normal mode
          line_left = '',
          line_right = '',
          line_down = '<C-j>',
          line_up = '<C-k>',
        },
      })
    end
  },


  -- COLOR SCHEMES --
  -------------------
  -- Main colorscheme has to be loaded first, which can be achieved with `priority=1000`
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        }
      })

      vim.cmd.colorscheme("tokyonight")

      vim.opt.number = true

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
      -- :TSUpdate       Needs to happen when treesitter is upgraded
      -- :TSInstallInfo  A list of all available languages and their installation status
      -- :TSModuleInfo   A table showing what modules are enabled for what languages
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "css", "dockerfile", "fish", "gitcommit", "gitignore", "html", "javascript", "json", "json5", "jsonc", "lua", "markdown", "markdown_inline", "python", "toml", "typescript", "vim", "vimdoc", "yaml" },
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
          disable = {"ruby"}
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
  },

  -- COMPLETIONS --
  -----------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    config = function()
      vim.opt.completeopt = "menu,menuone,noselect"

      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-a>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- `select=false` to only confirm explicitly selected items.
        }),

        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          },
          {
            { name = 'buffer' },
          }
        )
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

    end
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      local cmp = require("cmp")
    end
  },
})

vim.opt.clipboard = "unnamedplus"  -- Always use the OS clipboard

-- Clipboard support for WSL
if vim.fn.has('wsl') == 1 then
  vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('Yank', { clear = true }),
  callback = function()
    vim.fn.system('clip.exe', vim.fn.getreg('"'))
  end,
  })
end


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

------------------
-- LSP (common) --
------------------
local on_attach = function(_, bufnr)
  -- Diagnostics
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {silent=true})
  -- open location list with a list of all issues
  vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist, {silent=true})
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {silent=true})
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {silent=true})

  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=true})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=true}) -- Jump to the definition
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=true}) -- Jump to declaration
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=true}) -- Find all references

  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {buffer=true})

  -- configure function signature
  require "lsp_signature".on_attach({}, bufnr)
end

-----------------------
-- LANGUAGE SPECIFIC --
-----------------------
-- Based on: https://dev.to/vonheikemen/can-we-manage-neovims-lsp-client-without-plugins-3mge

-- JavaScript
local ftJavaScript = vim.api.nvim_create_augroup("ftJavaScript", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  group = ftJavaScript,
  callback = function()
    vim.keymap.set("n", "<leader>r", ":!node %<cr>")
  end
})

-- Lua
local ftLua = vim.api.nvim_create_augroup("ftLua", { clear = true })
vim.api.nvim_create_autocmd("FileType", { -- triggers whenever a filetype is set
  pattern = "lua",
  group = ftLua,
  callback = function()
    vim.lsp.set_log_level(vim.log.levels.INFO)
    local bufname = vim.api.nvim_buf_get_name(0) -- 0 means current buffer
    local project_root = vim.fs.dirname(vim.fs.find({".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml"}, { upward = true })[1]) or (#bufname == 0 and vim.loop.cwd()) or vim.fs.dirname(bufname)
    -- We can re-run it, because default impl reuses the LS client when name and root_dir attributes match
    local client_id = vim.lsp.start({
      name = "Sumneko Lua (lua-language-server)",
      cmd = {"lua-language-server"},
      root_dir = project_root,
      settings = { -- these are language server specific settings
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {'vim'}, -- Get the language server to recognize the `vim` global
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
            checkThirdParty = false,  -- Removes the "Do you need to configure your work environment as xyz" error
          },
          telemetry = {
            enable = false, -- Do not send telemetry data containing a randomized but unique identifier
          },
        }
      },
      on_attach = on_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
    vim.lsp.buf_attach_client(0, client_id) -- Notifies LS about changes
  end
})

-- Python
-- Should call this within a FileType autocmd or put the call in a `ftplugin/<filetype_name>.lua`
local ftPython = vim.api.nvim_create_augroup("ftPython", { clear = true })
vim.api.nvim_create_autocmd("FileType", { -- triggers whenever a filetype is set
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

    -- We can re-run it, because default impl reuses the LS client when name and root_dir attributes match
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
      on_attach = on_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
    vim.lsp.buf_attach_client(0, client_id) -- Notifies LS about changes
  end
})

-- Ruby
-- Should call this within a FileType autocmd or put the call in a `ftplugin/ruby.lua`
local ftRuby = vim.api.nvim_create_augroup("ftRuby", { clear = true })
vim.api.nvim_create_autocmd("FileType", { -- triggers whenever a filetype is set
  pattern = "ruby",
  group = ftRuby,
  callback = function()
    vim.keymap.set("n", "<leader>r",
      function()
        if vim.api.nvim_buf_get_name(0) == '' then
          vim.notify("Save file to run ruby")
        else
          vim.notify(vim.cmd.write())
          vim.notify(vim.fn.system({"ruby", vim.fn.expand("%")}))
        end
      end,
      { buffer=true }
    )

    -- Solargraph Language Server
    local bufname = vim.api.nvim_buf_get_name(0) -- 0 means current buffer
    local project_root = vim.fs.dirname(vim.fs.find({'.git', 'Gemfile'}, { upward = true })[1]) or (#bufname == 0 and vim.loop.cwd()) or vim.fs.dirname(bufname)

    -- We can re-run it, because default impl reuses the LS client when name and root_dir attributes match
    local client_id = vim.lsp.start({
      name = 'Ruby Solargraph',
      cmd = {'solargraph', 'stdio'},
      root_dir = project_root,
      settings = { -- these are language server specific settings
        solargraph = {
          diagnostics = true,
          completion = true,
          flags = {
            debounce_text_changes = 150
          },
          initializationOptions = {
            formatting = true
          }
        }
      },
      on_attach = on_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
    vim.lsp.buf_attach_client(0, client_id) -- Notifies LS about changes
  end
})


vim.cmd.helptags("ALL")
