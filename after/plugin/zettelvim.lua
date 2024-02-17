print('Hello, from after.plugin.zettelvim')

local callZettel = require('zettelvim.config')

---- CreatorFind Normal Mode
vim.keymap.set("n", "<leader>zf", callZettel.NormalCall(), {noremap = true, silent = true})
---- CreatorFind Visual Mode
vim.keymap.set("v", "zf", callZettel.VisualCall(), {noremap = true, silent = true})

print("ZettelVim carregado com sucesso!")
