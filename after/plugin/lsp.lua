-- LSP Native
require'lspconfig'.pylsp.setup{
    cmd = {"/home/ggrl/.config/ambiente_geologico/bin/python"},
    on_attach = function(client,bufnr)
    vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=0})
    end,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = {'E501'},
                },
            },
        },
    },
}

local lsp = require('lsp-zero')

lsp.preset('recommended')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

vim.keymap.set('i', '<C-p>', cmp.mapping.select_prev_item(cmp_select))
vim.keymap.set('i', '<C-n>', cmp.mapping.select_next_item(cmp_select))
vim.keymap.set('i', '<C-y>', cmp.mapping.confirm({ select = true }))
vim.keymap.set('i', '<C-Space>', cmp.mapping.complete())

lsp.set_preferences({
    sign_icons = { }
})


lsp.setup()

