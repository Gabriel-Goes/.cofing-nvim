-- Configurações do Vim Fugitive
-- Função para adicionar todos os arquivos do diretório atual ao git
--
local function GitAddLocal()
    if vim.fn.expand("%:p:h") ~= vim.fn.getcwd() then
        print("Apenas o diretório atual foi adicionado ao git")
        vim.cmd("Git add .")
    elseif vim.fn.system("git rev-parse --is-inside-work-tree"):match("true") then
        if vim.fn.system("git status --porcelain") ~= "" then
            vim.cmd("Git add .")
            print("Arquivos adicionados ao git.")
        end
    end
end

local function GitCommit()
    local message = vim.fn.input("Mensagem do commit: ")
    if message == "" then
        vim.cmd("Git commit")
    else
        vim.cmd('Git commit -m "' .. message .. '"')
    end
end

local function GitGraph()
    vim.cmd("vertical Git log --all --oneline --graph --decorate")
end

local function GitPush()
    vim.cmd("Git push")
end


-- Keymaps para as funções
vim.keymap.set("n","<leader>gs", "<cmd>vertical Git<CR>")
vim.keymap.set("n","<leader>gA", GitAddLocal)
vim.keymap.set("n","<leader>gc", GitCommit)
vim.keymap.set("n","<leader>gg", GitGraph)
vim.keymap.set("n","<leader>gp", GitPush)
