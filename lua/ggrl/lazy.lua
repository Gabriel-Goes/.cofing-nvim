print('Hello, from lua/ggrl/lazy.lua')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {

    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
-- Telescope
    'junegunn/fzf',
    'junegunn/fzf.vim',
    'BurntSushi/ripgrep',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'nvim-telescope/telescope.nvim', tag = '0.1.6',
         dependencies = {'nvim-lua/plenary.nvim'}
    },
    'mbbill/undotree',
    'theprimeagen/harpoon',
    'tpope/vim-fugitive',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
-- Treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
-- LSP Support
    'VonHeikemen/lsp-zero.nvim',
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'python-mode/python-mode',
-- Autocompletion
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
-- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
-- Neotest
    'nvim-neotest/neotest',
    'nvim-neotest/neotest-python',
    'sharkdp/fd',
-- Airline
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'edkolev/tmuxline.vim',
-- Colors
    'folke/tokyonight.nvim',
    'folke/lsp-colors.nvim',
    'morhetz/gruvbox',
    'sainnhe/sonokai',
    'savq/melange',
    'sainnhe/everforest',
    { "catppuccin/nvim", as = "catppuccin" },
    ({'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }),
-- Cursor
    'yamatsum/nvim-cursorline',
    'mawkler/modicator.nvim',
-- UML plugin
    'javiorfo/nvim-soil',
    'javiorfo/nvim-nyctophilia',
    'aklt/plantuml-syntax',
-- ZettelVim
    'Gabriel-Goes/ZettelVim',
-- File Explorer 
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
-- Markdown Preview   
    "iamcco/markdown-preview.nvim",
-- Github Copilot
    'github/copilot.vim',
}

require("lazy").setup(plugins, opts)
