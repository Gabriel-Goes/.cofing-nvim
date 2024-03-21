-- Configurações do Vim Fugitive
-- Função para adicionar todos os arquivos do diretório atual ao git
function vim.cmd.GitAddLocal()
    -- Checa o diretório atual
    -- Se não estiver no diretório do arquivo do buffer, retorna
    if vim.fn.expand("%:p:h") ~= vim.fn.getcwd() then
        -- printa o diretorio atual e diz que apenas ele foi add
        print("Apenas o diretório atual foi adicionado ao git")
        vim.cmd("Git add .")
        return
    -- Se estiver, checa se o diretório é um repositório git
    -- Se não for, retorna
    elseif vim.fn.system("git rev-parse --is-inside-work-tree") == 1 then
        return
    -- Se for, checa se o diretório está limpo
    -- Se estiver, retorna
    elseif vim.fn.system("git diff --quiet") == 1 then
        return
    -- Se não estiver, adiciona todos os arquivos
    else
        vim.cmd("Git add .")
    end
    -- printa na linha do buffer atual todos os arquivos que foram adicionados
    vim.cmd("echo 'Arquivos adicionados ao git: '")
end

-- Função para comitar as mudanças com uma mensagem
-- inicia pedindo a mensagem na linha de comando
function vim.cmd.GitCommit()
    local message = vim.fn.input("Mensagem do commit: ")
    if message == "" then
        vim.cmd("Git commit")
    else
        vim.cmd('Git commit -m "' .. message .. '"')
    end
end

-- Função para mostrar git log --graph --oneline --all --decorate no  gs
function vim.cmd.GitGraph()
    vim.cmd("Git log --graph --oneline --all --decorate")
end

-- Função para fazer push no repositório
function vim.cmd.GitPush()
    if vim.fn.system("git rev-parse --is-inside-work-tree") == 1 then
        return
    -- Se Git remove -v retornar 'fatal'
    elseif vim.cmd("Git remote -v") == 'fatal'  then
        vim.cmd("Git remote add origin")
        print("Repositório não tem um remote")
        return
    else
        local result = vim.fn.system("git push")
        if result == 0 then
            print("Push bem sucedido")
        end
    end
end

-- Keymaps para as funções
vim.keymap.set("n","<leader>gs", vim.cmd.Git)
vim.keymap.set("n","<leader>gA", vim.cmd.GitAddLocal)
vim.keymap.set("n","<leader>gc", vim.cmd.GitCommit)
vim.keymap.set("n","<leader>gg", vim.cmd.GitGraph)
vim.keymap.set("n","<leader>gp", vim.cmd.GitPush)
