-- Nvim remaps
vim.g.mapleader = " "

-- Move line
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Tabs and Buffers
vim.keymap.set('n', "<A-w>", "<C-w>")
vim.keymap.set('n', "<A-t>", vim.cmd.tabnew)
vim.keymap.set('n', "<A-c>", vim.cmd.tabc)

-- change buffers with Alt + j/k
vim.keymap.set("n", "<A-k>", "<cmd>bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<cmd>bp<CR>", { noremap = true, silent = true })

-- Delete buffer
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>",
               { noremap = true, silent = true })
-- Save file
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>",
               { noremap = true, silent = true })

-- keymap to source current file
vim.keymap.set("n", "<leader>cc", "<cmd>update<CR>:source %<CR>",
               { noremap = true, silent = true })

-- remap para chmod +x
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>",
               { noremap = true, silent = true })
-- Explorer
vim.keymap.set('n', '<leader>pp', ':Neotree<CR>')

-- Terminal
-- Keymap to open :term in a new window bellow the current one
vim.keymap.set("n", "<leader>tt", "<cmd>botright 15split term://$SHELL<CR>",
               { noremap = true, silent = true })

-- Exec current buffer if it's a shell script
vim.keymap.set("n", "<leader>ee", "<cmd><bar> exec '!%'<bar><CR>",
               { noremap = true, silent = true })

--print("lua/ggrl/remap.lua carregado com sucesso!")
