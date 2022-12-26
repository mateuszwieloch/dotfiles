vim.g.mapleader = " "

-------------
-- GENERAL --
-------------
-- Support for the filepath:line format when opening neovim
vim.cmd("packadd! vim-fetch")

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

------------
-- SEARCH --
------------
vim.keymap.set("n", "<bs>", ":noh<cr>")

-- TODO
-- set gdefault            " s/<pattern>/<replacement> has g flag set by default
--                         " (g means replace all occurences in line)
-- set incsearch           " highlights first match while still typing search term
-- set hlsearch            " highlights all matches after performing search
-- set ignorecase          " case insensitive pattern matching
-- set smartcase           " override ignorecase if pattern contains upcase
--
-- " double click highlights all occurences of word
-- map <2-LeftMouse> *
-- " in visual mode search for selection with //
-- vnoremap // y/<C-R>"<CR>
--
-- " backspace to remove search highlight
-- nnoremap <bs> :noh<cr>

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
-- TODO: allow Ctrl-v in insert mode
-- imap <C-v> <C-r><C-o>+

vim.cmd("packadd! nvim-surround")
require("nvim-surround").setup()
-- Integrates with nvim-treesitter and nvim-treesitter-textobjects
-- 

vim.cmd("packadd! whitespace-nvim")
local whitespace = require("whitespace-nvim")
whitespace.setup()
vim.api.nvim_create_user_command("TrimWhitespace", whitespace.trim, {})

vim.cmd("packadd! comment")
require("Comment").setup()
-- Combine with https://github.com/JoosepAlviste/nvim-ts-context-commentstring if there are nested languages (common in web development)
-- gcc for line comment
-- gbc for block comment
-- gcO open comment above
-- gcA append comment

vim.cmd("packadd! vim-ReplaceWithRegister")

-------------
-- TEXT OBJECTS
------------------
vim.cmd("packadd! vim-textobj-user")
-- Prerequisite of the ones below

vim.cmd("packadd! vim-textobj-entire")
-- ae  entire file
-- ie  entire file but skip empty lines at beginning and end

vim.cmd("packadd! vim-textobj-indent")
-- ai ii  around(with whitespace around)/inside indent

vim.cmd("packadd! vim-textobj-line")
-- al il  around(with whitespace around)/inside line

-------------
-- INDENTS --
-------------
vim.opt.smartindent = true     -- autoindent = same indent as line above; smartindent = autoindent + one extra level of indentation in some cases
vim.opt.expandtab = true       -- convert tabs to spaces
vim.opt.tabstop = 2            -- number of visual spaces per <tab>
vim.opt.softtabstop = 2        -- number of spaces in tab when *editing* (how many will be added or deleted)
vim.opt.shiftwidth = 2         -- >> indents by 2 spaces
vim.opt.shiftround = true      -- >> indents to next multiple of 'shiftwidth'

-- TODO
-- set breakindent
-- set showbreak=\ \  " indent

-------------
-- WINDOWS --
-------------
-- new windows appear below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true
-- split the window
vim.keymap.set("n", "<A-v>", ":vsplit<cr>")
vim.keymap.set("n", "<A-s>", ":split<cr>")
-- navigate between vim windows
vim.keymap.set({"n", "v"}, "<A-h>", "<C-W>h")
vim.keymap.set({"n", "v"}, "<A-l>", "<C-W>l")
vim.keymap.set({"n", "v"}, "<A-j>", "<C-W>j")
vim.keymap.set({"n", "v"}, "<A-k>", "<C-W>k")
-- move the current vim window
vim.keymap.set({"n", "v"}, "<A-H>", "<C-W>H")
vim.keymap.set({"n", "v"}, "<A-L>", "<C-W>L")
vim.keymap.set({"n", "v"}, "<A-J>", "<C-W>J")
vim.keymap.set({"n", "v"}, "<A-K>", "<C-W>K")
-- make windows equal size
vim.keymap.set({"n", "v"}, "<A-=>", "<C-W>=")
-- TODO
-- " make current window the only window on the screen
-- noremap <leader>wo <C-W>o
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

-------------------
-- COLOR SCHEMES --
-------------------
vim.cmd("packadd! tokyonight")
vim.cmd("packadd! rose-pine")
vim.cmd.colorscheme("tokyonight")
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "LightGray" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "gray" })

---------
-- GIT --
---------
vim.cmd("packadd! gitsigns")
require("gitsigns").setup()
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "green" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "gold2" })

-------------
-- HARPOON --
-------------
-- TODO: should I use this?
-- Saves marks *per project*
-- Saves position in file on buffer change and quit/exit

---------------
-- TELESCOPE --
---------------
vim.cmd("packadd! plenary")
vim.cmd("packadd! telescope") -- requires plenary.nvim
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

----------------
-- TREESITTER --
----------------
-- nvim-ts-autotag - optional extension to autoclose and autorename html tags
-- p00f/nvim-ts-rainbow - rainbow parantheses
vim.cmd("packadd! treesitter")
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
})
vim.cmd("packadd! treesitter-context")
require("treesitter-context").setup()
-- TODO: add https://github.com/nvim-treesitter/nvim-treesitter-textobjects

-- TODO
-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
-- set foldlevel=99


vim.cmd.helptags("ALL")
