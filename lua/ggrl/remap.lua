local nnoremap = require("ggrl.keymap").nnoremap

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

nnoremap("<leader>pv","<cmd>Ex<CR>")
nnoremap("<leader>pq", "<cmd>Telescope <CR>")
nnoremap("<leader>pr", "<cmd>Telescope buffers<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
