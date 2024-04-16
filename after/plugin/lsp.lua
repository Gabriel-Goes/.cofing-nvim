-- Autor: Gabriel Góes Rocha de Lima
-- after/plugin/lsp.lua
-- Last Change: 2024-02-03 20:46
-- LSP Native
-- print('Hello, from after/plugin/lsp.lua')

--  Mason LSP
require('mason').setup()
require('mason-lspconfig').setup({
--    ensure_installed = { 'lua_ls', 'pylsp', 'ltex', 'marksman',
    --                          'bashls',},
    sync_install = true,
    auto_install = true,
})

-- Neoconf
--require('neoconf').setup({
--})

-- LSP Zero
local lsp_zero = require('lsp-zero')
lsp_zero.setup()

-- On attach function
local on_attach = function(client, bufnr)
    local buf_set_keymap = function(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end
    -- Mapeamento de teclas
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', {})
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {})
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {})
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {})
end

-- Configurações VIMdiagnostic
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

-- Autocomando para janelas de diagnóstico flutuantes
vim.api.nvim_create_autocmd({"CursorHold"}, {
    callback = function()
        if vim.api.nvim_get_mode().mode == "n" then
            vim.diagnostic.open_float(nil, {
                focusable = false,
                close_events = {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"},
                border = 'single',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            })
        end
    end,
})

-- Change diagnostic symbols in the sign column (gutter)
-- Definição de símbolos de diagnóstico
local signs = { Error = "✘", Warn = "󰀪", Hint = "󰌶", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end

-- LSP CLIENTS
local home_user = os.getenv('HOME')

-------------- Lua_lsp
require('lspconfig').lua_ls.setup{
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-------------- Pylsp
require'lspconfig'.pylsp.setup{
    cmd = {vim.fn.stdpath('data') .. '/mason/bin/pylsp'},
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = {
                        'E501'
                    },
                },
                jedi_completion = {
                    enabled = true,
                },
                jedi_definition = {
                    enabled = true,
                },
                jedi_hover = {
                    enabled = true,
                },
                jedi_references = {
                    enabled = true,
                },
                jedi_signature_help = {
                    enabled = true,
                },
                jedi_symbols = {
                    enabled = true,
                },
            },
        },
    },
}
-------------- LaTex
require'lspconfig'.ltex.setup{
    on_attach = on_attach,
    filetypes = {"tex", "bib"},
    settings = {
        ltex = {
            language = "pt-BR",
            dictionary = {
                ["pt-BR"] = vim.fn.readfile(vim.fn.expand("~/.config/nvim/dictionary/pt-BR.dic")),
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

-- print("LSP Carregado com sucesso")
