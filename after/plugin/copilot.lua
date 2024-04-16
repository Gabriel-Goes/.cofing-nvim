-- Copilot remaps
vim.g.copilot_no_tab_map=true
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-K>', '<Plug>(copilot-accept-line)')
vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-[>', '<Plug>(copilot-prev)')
