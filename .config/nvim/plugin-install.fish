#!/usr/bin/env fish

# COLOR SCHEMES
# -------------
git clone --depth 1 https://github.com/rose-pine/neovim.git ~/.config/nvim/pack/colorschemes/opt/rose-pine
git clone --depth 1 https://github.com/folke/tokyonight.nvim.git ~/.config/nvim/pack/colorschemes/opt/tokyonight

# GENERAL
# -------
# support for the file:line format when opening files
git clone --depth 1 https://github.com/wsdjeg/vim-fetch ~/.config/nvim/pack/main/opt/vim-fetch

# EDITING
# -------
git clone --depth 1 https://github.com/kylechui/nvim-surround.git ~/.config/nvim/pack/main/opt/nvim-surround
git clone --depth 1 https://github.com/johnfrankmorgan/whitespace.nvim.git ~/.config/nvim/pack/main/opt/whitespace-nvim
git clone --depth 1 https://github.com/numToStr/Comment.nvim.git ~/.config/nvim/pack/main/opt/comment
git clone --depth 1 https://github.com/inkarkat/vim-ReplaceWithRegister.git ~/.config/nvim/pack/main/opt/vim-ReplaceWithRegister

# TEXT OBJECTS
# ------------
git clone --depth 1 https://github.com/kana/vim-textobj-user.git ~/.config/nvim/pack/main/opt/vim-textobj-user
git clone --depth 1 https://github.com/kana/vim-textobj-entire.git ~/.config/nvim/pack/main/opt/vim-textobj-entire
git clone --depth 1 https://github.com/kana/vim-textobj-indent.git ~/.config/nvim/pack/main/opt/vim-textobj-indent
git clone --depth 1 https://github.com/kana/vim-textobj-line.git ~/.config/nvim/pack/main/opt/vim-textobj-line

# GIT
# ---
git clone --depth 1 https://github.com/lewis6991/gitsigns.nvim.git ~/.config/nvim/pack/main/opt/gitsigns

# TELESCOPE
# ---------
# plenary only because it's a dependency
git clone --depth 1 https://github.com/nvim-lua/plenary.nvim.git ~/.config/nvim/pack/main/opt/plenary
git clone --depth 1 https://github.com/nvim-telescope/telescope.nvim.git ~/.config/nvim/pack/main/opt/telescope

# TREESITTER
# ----------
git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter.git ~/.config/nvim/pack/main/opt/treesitter
# keep funtion signature in the first line of the buffer if it's not visible
git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter-context.git ~/.config/nvim/pack/main/opt/treesitter-context
#-- nvim-ts-autotag - optional extension to autoclose and autorename html tags
#-- p00f/nvim-ts-rainbow - rainbow parantheses

# LUALINE
# -------
git clone --depth 1 https://github.com/nvim-lualine/lualine.nvim.git ~/.config/nvim/pack/main/opt/lualine

# LSP
# ---
# LSP Support
git clone --depth 1 https://github.com/neovim/nvim-lspconfig.git ~/.config/nvim/pack/lsp/opt/nvim-lspconfig
git clone --depth 1 https://github.com/williamboman/mason.nvim.git ~/.config/nvim/pack/lsp/opt/mason.nvim
git clone --depth 1 https://github.com/williamboman/mason-lspconfig.nvim.git ~/.config/nvim/pack/lsp/opt/mason-lspconfig.nvim
# Autocompletion
git clone --depth 1 https://github.com/hrsh7th/nvim-cmp.git ~/.config/nvim/pack/lsp/opt/nvim-cmp
git clone --depth 1 https://github.com/hrsh7th/cmp-buffer.git ~/.config/nvim/pack/lsp/opt/cmp-buffer
git clone --depth 1 https://github.com/hrsh7th/cmp-path.git ~/.config/nvim/pack/lsp/opt/cmp-path
git clone --depth 1 https://github.com/saadparwaiz1/cmp_luasnip.git ~/.config/nvim/pack/lsp/opt/cmp_luasnip
git clone --depth 1 https://github.com/hrsh7th/cmp-nvim-lsp.git ~/.config/nvim/pack/lsp/opt/cmp-nvim-lsp
git clone --depth 1 https://github.com/hrsh7th/cmp-nvim-lua.git ~/.config/nvim/pack/lsp/opt/cmp-nvim-lua
# Snippets
git clone --depth 1 https://github.com/L3MON4D3/LuaSnip.git ~/.config/nvim/pack/lsp/opt/LuaSnip
git clone --depth 1 https://github.com/rafamadriz/friendly-snippets.git ~/.config/nvim/pack/lsp/opt/friendly-snippets
# LSP Zero
git clone --depth 1 https://github.com/VonHeikemen/lsp-zero.nvim.git ~/.config/nvim/pack/lsp/opt/lsp-zero
