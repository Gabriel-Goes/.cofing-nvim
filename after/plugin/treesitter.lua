-- print('Hello, from after/plugin/treesitter.lua')
require'nvim-treesitter.configs'.setup {
--     ensure_installed = {
--         'bash',
--         'c',
--         'cpp',
--         'css',
--         'dockerfile',
--         'go',
--         'html',
--         'javascript',
--         'json',
--         'lua',
--         'python',
--         'regex',
--         'rust',
--         'toml',
--         'typescript',
--         'yaml',
--     },
    sync_install = true,
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
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
}
