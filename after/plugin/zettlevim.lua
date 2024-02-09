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
-------------------- ZettleVimCreateorFind(word) ------------------------------
function ZettleVimCreateorFind(word)
    -- Verifica se a palavra é vazia
    if word == "" then
        print("Sem palavras, tsc tsc tsc ...")
        return
    end

    local filepath = tempestade_path .. word
    local tempCerebralPath = tempestade_path .. "tempestade cerebral"

    -- Verifica se o arquivo existe. Se não, cria o arquivo
    if vim.fn.filereadable(filepath) == 0 then
        local titulo = "# " .. capitalizeFirstLetter(word)
        -- Cria o arquivo com título e pula linha
        vim.fn.writefile({titulo, ''}, filepath)

        -- Adiciona a palavra ao arquivo "tempestade cerebral" como um indice
        local tempCerebralContent  = vim.fn.readfile(tempCerebralPath)
        table.insert(tempCerebralContent,"    - " ..  word)
        vim.fn.writefile(tempCerebralContent, tempCerebralPath)
        print(word .. " adicionado ao arquivo tempestade cerebral")
    end
        -- abre o arquivo existente
        vim.cmd('edit ' .. filepath)
end
-------------------------------------------------------------------------------
-- CreatorFind Visual Mode
vim.keymap.set("v", "gF", function()
    -- Yank a seleção do buffer no visual mode, e apenas a seleção ao registro 'a' 
    vim.cmd("normal! \"ay")
    -- Imediatamente após o yan, obtém a seleção do registro 'a' e armazena na variável selection
    local selection = vim.fn.getreg("a")
    print("Seleção: " .. selection)
    -- Chama a função ZettleVimCreateorFind com a seleção
    ZettleVimCreateorFind(selection)
    -- limpa o registro 'a'
    vim.fn.setreg("a", "")
end, {noremap = true, silent = true})
-- CreatorFind Normal Mode
vim.keymap.set("n", "<leader>gg", function()
    print("Comando <leader>gg executado ...")
    local word = vim.fn.expand("<cword>")
    ZettleVimCreateorFind(word)
end, {noremap = true, silent = true})
print("ZettleVim carregado com sucesso")
