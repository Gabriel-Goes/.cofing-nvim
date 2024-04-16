-- Autor: Gabriel Góes Rocha de Lima
-- after/plugin/set.lua
-- Last Change: 2024-02-05 00:48
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.hidden = false
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.guicursor = ""
vim.opt.guifont = 'Hermit:h12'
vim.o.cursorline = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 250
vim.g.tmuxline_theme = "iceberg"
vim.g.pymode_lint_signs = 0
vim.opt.numberwidth = 1
vim.opt.foldcolumn = "1"
vim.opt.signcolumn = "yes:1"
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.shell = 'bash'
vim.opt.shellcmdflag = '-c'
vim.opt.shellredir = '>%s 2>&1'
vim.opt.shellpipe = '2>&1| tee'
-- Python-Mode Configurations
vim.g.pymode_lint = 0
vim.g.pymode_rope = 0
vim.g.pymode_folding = 1
vim.g.pymode_format = 1
vim.g.python3_host_prog = '~/.pyenv/versions/sismologia/bin/python3'

-- Terminal configurations with relative numbers and numbers
vim.opt.termguicolors = true
vim.cmd([[autocmd TermOpen * setlocal winhighlight=Normal:NormalFloat]])
vim.cmd([[autocmd TermOpen * setlocal bufhidden=hide]])
vim.cmd([[autocmd TermOpen * startinsert]])
-- Keymaps
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], {noremap = true, silent = true})
