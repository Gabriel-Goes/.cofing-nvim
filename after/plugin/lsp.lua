-- Autor: Gabriel Góes Rocha de Lima
-- after/plugin/lsp.lua
-- Last Change: 2024-02-03 20:46
-- LSP Native
print('Hello, from after/plugin/lsp.lua')
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'pylsp', 'ltex', 'marksman' },
})
local lsp = require('lsp-zero')
lsp.setup()

-- On attach function
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }
    -- Mapeamento de teclas
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Configurações VIMdiagnostic
-- Enable floating window in normal mode and disable in insert mode
vim.api.nvim_create_autocmd({"CursorHold",}, {
    callback = function()
        if vim.api.nvim_get_mode().mode == "n" then
            vim.diagnostic.virtual_text = false
            vim.diagnostic.open_float(nil, {
                focusable = false,
                close_events = {"BufLeave",
                                "CursorMoved",
                                "InsertEnter",
                                "FocusLost"},
                border = 'single',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            },
            vim.diagnostic.hint)
        end

    end,
})

vim.diagnostic.config({
    -- enable buffer diagnostics hover mouse
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    hint = {
        source = "true",
        preview = true,
        scope = "buffer",
    },
    float = {
        source = "true",
        preview = true,
        scope = "buffer",
    }
})

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = "󰅚",
                Warn = "󰀪",
                Hint = "󰌶",
                Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon,
                           texthl = hl,
                           numhl = "" })
end

-- LSP CLIENTS
print('Configurando LSP CLIENTS')
-------------- Lua_lsp
require'lspconfig'.lua_ls.setup{
    on_attach = on_attach,
    settings = {
        filetypes = {'lua'},
        Lua = {
            diagnostics = {
                enable = true,
                disable = {"undefined-global"},
                globals = {'vim'},
            },
        },
    }
}

-------------- Pylsp
require'lspconfig'.pylsp.setup{
--    cmd = {"/home/ggrl/.config/ambiente_geologico/bin/pylsp"},
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = {'E501'},
                },
            },
        },
       diagnostics = {
           enable = true,
           disable = {"undefined-variable"},
           globals = {"vim"},
       },
    }
}
-------------- LaTex
require'lspconfig'.ltex.setup{
    on_attach = on_attach,
    filetypes = {"tex", "bib"},
    settings = {
        ltex = {
            language = "pt-BR",
            dictionary = {
                ["pt-BR"] = vim.fn.readfile(vim.fn.expand("/home/ggrl/.config/nvim/dictionary/pt-BR.dic")),
            },
            enabled = true,
        }
    }
}

-------------- Marksman
require'lspconfig'.marksman.setup{
    on_attach = on_attach,
    filetypes = {"markdown"},
    settings = {
        marksman = {
            enabled = true,
        }
    }
}

print("LSP Carregado com sucesso")
