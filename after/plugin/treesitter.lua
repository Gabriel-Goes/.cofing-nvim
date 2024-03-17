print('Hello, from after/plugin/treesitter.lua')
require'nvim-treesitter.configs'.setup {
    ensure_installed = {'python', 'markdown', 'lua', 'latex'},
    sync_install = true,
    auto_install = true,
    highlight = {
        -- 'false' will disable the whole extension
      enable = true,
      additional_vim_regex_highlighting = true,
    },
}
