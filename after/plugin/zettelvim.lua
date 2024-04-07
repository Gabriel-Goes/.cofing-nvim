-- .config/nvim/after/plugin/zettelvim.lua
-- Add path to lua files package.path for testing and implementing
local zettelvim_path = vim.fn.expand('~/projetos/ZettelVim/lua/?.lua')
package.path = package.path .. ';' .. vim.fn.expand(zettelvim_path)

require('zettelvim.init')
local zettelvim_config = require('zettelvim.config')

zettelvim_config.setup({
    visual_mode_keymap = 'qff',
    normal_mode_keymap = '<leader>qf',
    wiki_visual_mode_keymap = 'ws',
    wiki_normal_mode_keymap = '<leader>ws',
})
