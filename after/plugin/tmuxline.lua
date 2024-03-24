-- Tmux line configuration
--
local M = {}

M.setup = function()
local tmuxline = require('tmuxline')
tmuxline.setup {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    extensions = { 'fugitive', 'nvim-tree' },
    colors = {
        bg = '#282c34',
        fg = '#abb2bf',
        section_bg = '#383c44',
        section_fg = '#abb2bf',
        section_bg_alt = '#2c323d',
        section_fg_alt = '#abb2bf',
        section_bg_inactive = '#21252b',
        section_fg_inactive = '#5c6370',
        section_bg_alt_inactive = '#21252b',
        section_fg_alt_inactive = '#5c6370'
    }
}
end
return M
