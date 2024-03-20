-- Autor: Gabriel Góes Rocha de Lima
-- after/plugin/set.lua
-- Last Change: 2024-02-05 00:48
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- Configurações do nvim
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
vim.g.mapleader = " "
vim.g.pymode_lint_signs = 0
-- Aumentar o espaço da primeira coluna antes dos linenumbers
vim.opt.numberwidth = 1
-- Aumentar o tamanho da primeira coluna.
vim.opt.foldcolumn = "1"
-- Aumentar o espaço disponível por caractere no signicons
vim.opt.signcolumn = "yes:1"
vim.opt.showcmd = true
vim.opt.cmdheight = 1
--print("lua/ggrl/set.lua carregado com sucesso!")
