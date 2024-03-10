-- Nvim remaps
vim.g.mapleader = " "
-- Copilot remaps
vim.g.copilot_no_tab_map=true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")',
                        { silent = true, expr = true })
-- Move line
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- change buffers with Alt + j/k
vim.keymap.set("n", "<A-k>", "<cmd>bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<cmd>bp<CR>", { noremap = true, silent = true })
-- Delete buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>",
               { noremap = true, silent = true })
-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>",
               { noremap = true, silent = true })
-- remap para chmod +x
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>",
               { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pv', ':NvimTreeToggle<CR>')
--print("lua/ggrl/remap.lua carregado com sucesso!")
--
