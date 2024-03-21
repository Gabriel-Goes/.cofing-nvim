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
    extensions = { 'fugitive', 'nvim-tree' }
  }
end

return M
