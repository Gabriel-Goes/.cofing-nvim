-- Add path to lua files package.path
local zettelvim_path = vim.fn.expand('/home/ggrl/projetos/ZettelVim/lua/?.lua')
package.path = package.path .. ';' .. vim.fn.expand(zettelvim_path)

require('zettelvim.init')
local zettelvim_config = require('zettelvim.config')

zettelvim_config.setup({
    visual_mode_keymap = 'bf',
    normal_mode_keymap = '<leader>bf',
})
