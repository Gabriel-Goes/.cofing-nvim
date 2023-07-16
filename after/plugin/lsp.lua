-- LSP Native
require'lspconfig'.pylsp.setup{
    on_attach = function() 
    vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=0})
    end,
}

local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = { }
})


lsp.setup()

