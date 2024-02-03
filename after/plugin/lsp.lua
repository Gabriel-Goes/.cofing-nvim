-- LSP Native
local lsp = require('lsp-zero')
lsp.setup()

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
    },
})

vim.keymap.set('i', '<C-p>', cmp.mapping.select_prev_item(cmp_select))
vim.keymap.set('i', '<C-n>', cmp.mapping.select_next_item(cmp_select))
vim.keymap.set('i', '<C-y>', cmp.mapping.confirm({ select = true }))
vim.keymap.set('i', '<C-Space>', cmp.mapping.complete())

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
-- LSP CLIENTS
require'lspconfig'.pylsp.setup{
    cmd = {"/home/ggrl/.config/ambiente_geologico/bin/pylsp"},
    on_attach = function(client,bufnr)
    vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=bufnr})
    vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=bufnr})
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
require'lspconfig'.ltex.setup{
    filetypes = {"tex", "bib", "markdown"},
    settings = {
        ltex = {
            language = "pt-BR",
            dictionary = {
                ["pt-BR"] = vim.fn.readfile(vim.fn.expand("~/.config/nvim/dictionary/pt-BR.dic")),
            },
            enabled = true,
        }
    },
    on_attach = function(client,bufnr)
        vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=bufnr})
        vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=bufnr})
    end
}
require'lspconfig'.grammarly.setup{
    filetypes = {'markdown', 'tex'},
    autostart = false,
}
require'lspconfig'.marksman.setup{
    filetypes = {'markdown'},
    autostart = false,
}
