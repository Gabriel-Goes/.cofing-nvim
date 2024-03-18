-- print('Hello, from after/plugin/treesitter.lua')
require'nvim-treesitter.configs'.setup {
--    ensure_installed = {'python', 'markdown', 'latex'},
    sync_install = true,
    auto_install = true,
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anotations = 'e',
            toggle_tree = 'T',
            cycle = 'c',
            reset_query = 'r',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    highlight = {
        -- 'false' will disable the whole extension
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
    },
}
