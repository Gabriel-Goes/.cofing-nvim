local function get_env_name()
  local venv_path = os.getenv("VIRTUAL_ENV")
  if venv_path then
    local name = venv_path:match("^.+/(.+)$")
    return name and " " .. name or "NO ENV"
  else
    return "NO ENV"
  end
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},

        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {function() return get_env_name() end,
            cond = function() return vim.bo.filetype == 'python' end  -- Exibir somente para arquivos python
            },
            'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
        },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
        },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

