require('modicator').setup({
    show_warnings = false,
    highlights = {
        defaults ={
            bold = false,
            italic = false,
        },
    },
    cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    },
    integration = {
        lualine = {
            enable = true,
            mode_section = nil,
            highligh = 'bg',
        },
    },
})
