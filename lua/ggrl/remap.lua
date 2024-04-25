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

-- Terminal
-- Keymap to open :term in a new window bellow the current one
vim.keymap.set("n", "<leader>tt", "<cmd>botright 15split term://$SHELL<CR>",
               { noremap = true, silent = true })

-- Exec current buffer if it's a shell script
vim.keymap.set("n", "<leader>ee", "<cmd><bar> exec '!%'<bar><CR>",
               { noremap = true, silent = true })

-- Função para descompactar o arquivo tar
local function extract_tar_file()
    local node = require("neo-tree.sources.filesystem").get_node_at_cursor()
    if not node then
        print("No file selected.")
        return
    end

    local path = node.path
    if string.match(path, "%.tar$") or string.match(path, "%.tar.gz$") or string.match(path, "%.tgz$") then
        local cmd = "tar -xvf " .. vim.fn.shellescape(path) .. " -C " .. vim.fn.shellescape(vim.fn.fnamemodify(path, ":h"))
        vim.fn.jobstart(cmd, {
            on_stdout = function(_, data)
                if data then
                    print("Output: " .. table.concat(data, "\n"))
                end
            end,
            on_stderr = function(_, data)
                if data then
                    print("Error: " .. table.concat(data, "\n"))
                end
            end,
            on_exit = function(_, code)
                if code == 0 then
                    print("Extraction completed successfully.")
                else
                    print("Failed to extract file.")
                end
            end,
        })
    else
        print("The selected file is not a tar file.")
    end
end
vim.keymap.set("n", "<leader>et", extract_tar_file,
    { noremap = true, silent = true })

--print("lua/ggrl/remap.lua carregado com sucesso!")
