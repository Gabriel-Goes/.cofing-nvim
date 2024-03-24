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

    {"folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
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
-- Status Line
    { 'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'},
    'edkolev/tmuxline.vim',
--    'tjdevries/express_line.nvim',
    { 'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
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
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
-- Github Copilot
    'github/copilot.vim',
}

require("lazy").setup(plugins, opts)
