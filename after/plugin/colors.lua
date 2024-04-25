-- print('Hello, from after/plugin/colors.lua')
function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3b3b3b" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc66" })

end

ColorMyPencils('catppuccin')
