local nnoremap = require("ggrl.keymap").nnoremap
local addWord = require("ggrl.add_word").AddWordToDictionary

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pq", "<cmd>Telescope <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pr", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })

vim.g.copilot_no_tab_map=true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<', '<><Left>', { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>aw", addWord, { noremap = true, silent = true })
