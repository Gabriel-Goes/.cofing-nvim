-- Nvim remaps 
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { noremap = true, silent = true })

-- Copilot remaps
vim.g.copilot_no_tab_map=true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Move lines
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
