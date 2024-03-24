local indent_guides_ns = vim.api.nvim_create_namespace('indent_guides')

local function add_indent_guides()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_clear_namespace(bufnr, indent_guides_ns, 0, -1)
    local spaces_per_tab = vim.api.nvim_buf_get_option(bufnr, 'tabstop')

    local line_count = vim.api.nvim_buf_line_count(bufnr)
    for i = 1, line_count do
        local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]
        local indent, non_space = string.match(line, "^(%s*)(%S)")
        if indent then
            local indent_len = string.len(indent)
            local position = indent_len - (indent_len % spaces_per_tab)
            if position > 0 and non_space then
                -- Garante que a linha de guia seja adicionada apenas se houver texto não-espaço na linha.
                vim.api.nvim_buf_set_extmark(bufnr, indent_guides_ns, i - 1, position - 1, {
                    virt_text = {{'│', 'IndentGuides'}},
                    virt_text_pos = 'overlay',
                    hl_mode = 'blend',
                })
            end
        end
    end
end

vim.api.nvim_create_autocmd({"BufEnter", "TextChanged", "InsertLeave"}, {
    pattern = "*",
    callback = function()
        -- Limpa e re-aplica as guias de indentação para garantir a atualização ao editar.
        add_indent_guides()
    end,
})

vim.api.nvim_set_hl(0, 'IndentGuides', { fg = '#555555', bg = 'NONE', italic = true })
