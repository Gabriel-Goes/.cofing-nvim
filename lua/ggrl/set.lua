-- Autor: Gabriel Góes Rocha de Lima
-- after/plugin/set.lua
-- Last Change: 2024-02-05 00:48
--

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.hidden = false
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.guicursor = ""
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
vim.opt.termguicolors = true
