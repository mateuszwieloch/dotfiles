#!/usr/bin/env fish

# COLOR SCHEMES
git clone --depth 1 https://github.com/rose-pine/neovim.git ~/.config/nvim/pack/colorschemes/opt/rose-pine
git clone --depth 1 https://github.com/folke/tokyonight.nvim.git ~/.config/nvim/pack/colorschemes/opt/tokyonight

# GENERAL
# support for the file:line format when opening files
git clone --depth 1 https://github.com/wsdjeg/vim-fetch ~/.config/nvim/pack/main/opt/vim-fetch

# EDITING
git clone --depth 1 https://github.com/kylechui/nvim-surround.git ~/.config/nvim/pack/main/opt/nvim-surround
git clone --depth 1 https://github.com/johnfrankmorgan/whitespace.nvim.git ~/.config/nvim/pack/main/opt/whitespace-nvim
git clone --depth 1 https://github.com/numToStr/Comment.nvim.git ~/.config/nvim/pack/main/opt/comment
git clone --depth 1 https://github.com/inkarkat/vim-ReplaceWithRegister.git ~/.config/nvim/pack/main/opt/vim-ReplaceWithRegister

# TEXT OBJECTS
git clone --depth 1 https://github.com/kana/vim-textobj-user.git ~/.config/nvim/pack/main/opt/vim-textobj-user
git clone --depth 1 https://github.com/kana/vim-textobj-entire.git ~/.config/nvim/pack/main/opt/vim-textobj-entire
git clone --depth 1 https://github.com/kana/vim-textobj-indent.git ~/.config/nvim/pack/main/opt/vim-textobj-indent
git clone --depth 1 https://github.com/kana/vim-textobj-line.git ~/.config/nvim/pack/main/opt/vim-textobj-line

# GIT
git clone --depth 1 https://github.com/lewis6991/gitsigns.nvim.git ~/.config/nvim/pack/main/opt/gitsigns

# TELESCOPE
# plenary only because it's a dependency
git clone --depth 1 https://github.com/nvim-lua/plenary.nvim.git ~/.config/nvim/pack/main/opt/plenary
git clone --depth 1 https://github.com/nvim-telescope/telescope.nvim.git ~/.config/nvim/pack/main/opt/telescope

# treesitter
git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter.git ~/.config/nvim/pack/main/opt/treesitter
# keep funtion signature in the first line of the buffer if it's not visible
git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter-context.git ~/.config/nvim/pack/main/opt/treesitter-context
#-- nvim-ts-autotag - optional extension to autoclose and autorename html tags
#-- p00f/nvim-ts-rainbow - rainbow parantheses

# LSP
    #-- LSP Support
    #{'neovim/nvim-lspconfig'},
    #{'williamboman/mason.nvim'},
    #{'williamboman/mason-lspconfig.nvim'},
#
    #-- Autocompletion
    #{'hrsh7th/nvim-cmp'},
    #{'hrsh7th/cmp-buffer'},
    #{'hrsh7th/cmp-path'},
    #{'saadparwaiz1/cmp_luasnip'},
    #{'hrsh7th/cmp-nvim-lsp'},
    #{'hrsh7th/cmp-nvim-lua'},

    #-- Snippets
    #{'L3MON4D3/LuaSnip'},
    #{'rafamadriz/friendly-snippets'},
