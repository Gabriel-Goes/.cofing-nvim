ThemeManager = {
    themes = {},
}

function ThemeManager:addTheme(name, setupFunc)
    self.themes[name] = setupFunc
end

function ThemeManager:applyTheme(name)
    local themeSetup = self.themes[name]
    if themeSetup then
        themeSetup()
    else
        print("Theme not found: " .. name)
        error("Theme not found: " .. name)
    end
end

-- Adicionando configurações de temas usando a classe ThemeManager
ThemeManager:addTheme('catppuccin', function()
    require('catppuccin').setup({
                colorscheme = "dark_catppuccin",
                transparency = false,
                term_colors = true,
                styles = {
                    comments = "italic",
                    functions = "italic",
                    keywords = "italic",
                    strings = "italic",
                    variables = "italic",
                },
                integrations = {
                    treesitter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            enabled = true,
                            text = "",
                        },
                        underlines = {
                            errors = "underline",
                            hints = "underline",
                            warnings = "underline",
                            information = "underline",
                        },
                        extend_mode = true,
                        diagnostic_text = true,
                    },
                    lsp_trouble = true,
                    lsp_saga = true,
                    gitgutter = false,
                    gitsigns = true,
                    telescope = true,
                    nvimtree = {
                        enabled = true,
                        show_root = true,
                    },
                    which_key = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = true,
                    },
                    dashboard = true,
                    neogit = true,
                    vim_sneak = true,
                    fern = true,
                    barbar = true,
                    bufferline = true,
                    markdown = true,
                },
            })
    vim.cmd('colorscheme catppuccin')
end)

ThemeManager:addTheme('gruvbox', function()
    vim.cmd("colorscheme gruvbox")
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3b3b3b" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc66" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#252525" })
end)

ThemeManager:addTheme('tokyonight', function()
    require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = false },
            keywords = { italic = false },
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "dark", -- style for sidebars, see below
            floats = "dark", -- style for floating windows
        },
    })
    vim.cmd('colorscheme tokyonight')
end)

ThemeManager:addTheme('rose-pine', function()
    require('rose-pine').setup({
        disable_background = false,
    })
    vim.cmd('colorscheme rose-pine')
end)


-- Aplicando o tema
--ThemeManager:applyTheme('gruvbox') --/home/ggrl/.local/share/nvim/lazy/nvim/lua/catppuccin/init.lua
