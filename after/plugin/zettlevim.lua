-- Author: Gabriel Góes Rocha de Lima
-- Email: gabrielgoes@usp.br
-- Date: 2024-02-08
-- Last Modified: 2024-02-08
-- Version: 0.1
-- License: GPL
-- Description: Pluggin para transformar o neovim em um zettelkasten machine
-------------------------------------------------------------------------------
local tempestade_path = os.getenv("NVIM_TEMPESTADE")
-- Tratar todos os arquivos de um diretório como Markdown mesmo sem a extensão
local function setMarkdonwFileType()
    -- Obtém o caminho completo do arquivo atual
    local current_path = vim.fn.expand("%:p")
    -- verifica se o caminho atual começa com tempestade_path
    if current_path:sub(1, #tempestade_path) == tempestade_path then
        -- Ajusta o filetype para markdow
        vim.bo.filetype = "markdown"
    end
end
-- Cria autocmd que chama setMarkdonwFileType para arquivos em tempestade_path
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*",
    callback = setMarkdonwFileType,
    }
)
-- Transformando uma palavra é um título, Capitalize First Letter
local function capitalizeFirstLetter(str)
    return (str:gsub("^.", string.upper))
end
-------------------------------------------------------------------------------


------------------- ZettelVim - Biderecional Linked Files ---------------------
-- Função para identificar os blocos de links em um arquivo
local function findLinksBlock(filepath)
    local parser = vim.treesitter.get_parser(0, "markdown")
    local tree = parser:parse()[1]
    local root = tree:root()
    local header = "^---- links ----"
    local tail = "^---+$"
    local in_block = false
    local start_block, end_block
    local blocks = {}
    -- Percorre a árvore de sintaxe procurando por blocos de links
    for node in root:iter_children() do
        if node:type() == "paragraph" then
            local text = vim.treesitter.get_node_text(node, 0)
            if text:match(header) and not in_block then
                start_block = node:start()
                in_block = true
            elseif text:match(tail) and in_block then
                end_block = node:end_()
                table.insert(blocks, {start = start_block, ["end"] = end_block})
                in_block = false
            end
        end
    end
    return blocks
end
-- Função para ler os links de um bloco encontrado
local function readLinkBlocks(filepath, blocks)
    local all_links = {}
    if blocks and #blocks > 0 then

        local file_content = vim.fn.readfile(filepath)
        for _, block in ipairs(blocks) do
            local links = {}
            for i = block.start + 1, block["end"] - 1 do
                local line = file_content[i]
                if line:match("^#") then
                    table.insert(links, line)
                end
            end
            table.insert(all_links, links)
        end
    end
    return all_links
end
-- Função para processar os arquivos  e retornar os links
local function processMarkdownFile(filepath)
    local blocks = findLinksBlock(filepath)
    local links = {}
    if #blocks > 0 then
        links = readLinkBlocks(filepath, blocks)
    else
        print("Nenhum bloco de links encontrado")
    end
    return links
end
-- Função para Adicionar uma #word a um arquivo
local function addLinkToFile(filePath, word)
    local fileContent = vim.fn.readfile(filePath)
    local links = processMarkdownFile(filePath)
    -- se não houver word em links, adiciona a palavra
    if not vim.tbl_contains(links[1] or {}, word) then
        table.insert(fileContent, 4, word)
        vim.fn.writefile(fileContent, filePath)
    end
end
-- Função para criar um link bidirecional entre dois arquivos
function ZettleVimCreateBiderecionalLink(word)
    -- Verifica se no arquivo atual possui um link para a palavra no formato "palavra"
    local currentFileContent = vim.fn.readfile(vim.fn.expand("%:p"))
    local wordExists = false
    -- Verifica se a palavra já existe no arquivo
    for _, line in ipairs(currentFileContent) do
        if line:find(word) then
            wordExists = true
            break
        end
    end
    -- Se não houver, adiciona a palavra no topo do arquivo atual como um link
    if not wordExists then
        table.insert(currentFileContent, 4, word)
        -- Grava o conteúdo atualizado no arquivo
        vim.fn.writefile(currentFileContent, vim.fn.expand("%:p"))
    end
end
-------------------- ZettleVimCreateorFind(word) ------------------------------
function ZettleVimCreateorFind(word)
    -- Verifica se a palavra é vazia
    if word == "" then
        return
    end
    local filepath = tempestade_path .. word
    local tempCerebralPath = tempestade_path .. "tempestade cerebral"
    -- Verifica se o arquivo existe. Se não, cria o arquivo
    if vim.fn.filereadable(filepath) == 0 then
        local titulo = "# " .. capitalizeFirstLetter(word)
        local link_line_head = "---- links ---------------------------------------------------------------------"
        local link_line_tail = "--------------------------------------------------------------------------------"
        local arquivoCriador = vim.fn.expand("%:t:r")
        -- Cria o arquivo com título e pula linha, adiciona o link_line_head e link_line_tail
        vim.fn.writefile({titulo, '', link_line_head, arquivoCriador, link_line_tail, ''}, filepath)
        -- Adiciona a palavra ao arquivo "tempestade cerebral" como um indice
        local tempCerebralContent  = vim.fn.readfile(tempCerebralPath)
        table.insert(tempCerebralContent,"    - " ..  word)
        vim.fn.writefile(tempCerebralContent, tempCerebralPath)
        -- Cria um link bidirecional no arquivo atual apara a palavra
        ZettleVimCreateBiderecionalLink(word)
    -- Se a palavra já existe, checa se o arquivo atual já possui um link para a palavra
    else
        ZettleVimCreateBiderecionalLink(word)
    end
        local currentFile = vim.fn.expand("%:p")
        -- Adiciona um link para o arquivo atual no arquivo da palavra
        addLinkToFile(filepath, vim.fn.expand("%:t:r"))
        -- Adiciona um link para a palavra no arquivo atual
        addLinkToFile(currentFile, word)
        -- abre o arquivo existente
        vim.cmd('edit ' .. filepath)
end
-------------------------------------------------------------------------------
-- CreatorFind Visual Mode
vim.keymap.set("v", "gF", function()
    -- Salva o arquivo atual
    vim.cmd("w")
    -- Yank a seleção do buffer no visual mode, e apenas a seleção ao registro 'a'
    vim.cmd("normal! \"ay")
    -- Imediatamente após o yan, obtém a seleção do registro 'a' e armazena na variável selection
    local selection = vim.fn.getreg("a")
    -- Chama a função ZettleVimCreateorFind com a seleção
    ZettleVimCreateorFind(selection)
    -- limpa o registro 'a'
    vim.fn.setreg("a", "")
end, {noremap = true, silent = true})
-- CreatorFind Normal Mode
vim.keymap.set("n", "<leader>gg", function()
    vim.cmd("w")
    local word = vim.fn.expand("<cword>")
    ZettleVimCreateorFind(word)
end, {noremap = true, silent = true})
print("ZettleVim carregado com sucesso")
