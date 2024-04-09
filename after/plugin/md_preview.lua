-- Markdown Preview configuration for Neovim in Lua

-- Start the preview automatically when entering a Markdown buffer
vim.g.mkdp_auto_start = 0

-- Auto close the preview window when switching from a Markdown buffer to another buffer
vim.g.mkdp_auto_close = 1

-- Refresh the Markdown preview on save or leave insert mode instead of auto-refreshing as you edit or move the cursor
vim.g.mkdp_refresh_slow = 0

-- Allow the MarkdownPreview command to be used for all files, not just Markdown files
vim.g.mkdp_command_for_global = 0

-- Make the preview server accessible to others in your network. By default, it listens on localhost
vim.g.mkdp_open_to_the_world = 0

-- Use a custom IP to open the preview page, useful for remote Vim sessions
vim.g.mkdp_open_ip = ''

-- Specify a custom browser to open the preview page
vim.g.mkdp_browser = ''

-- Echo the preview page URL in the command line when opening the preview page
vim.g.mkdp_echo_preview_url = 0

-- A custom Vim function name to open the preview page. This function will receive the URL as a parameter
vim.g.mkdp_browserfunc = ''

-- Configuration options for Markdown rendering
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}

-- Use a custom Markdown CSS style. Must be an absolute path
vim.g.mkdp_markdown_css = ''

-- Use a custom highlight CSS style. Must be an absolute path
vim.g.mkdp_highlight_css = ''

-- Use a custom port to start the server or leave empty for a random port
vim.g.mkdp_port = ''

-- Customize the preview page title. ${name} will be replaced with the file name
vim.g.mkdp_page_title = '「${name}」'

-- Use a custom location for images
vim.g.mkdp_images_path = '/home/ggrl/imgs/.markdown_images'

-- Recognized filetypes that will have MarkdownPreview commands
vim.g.mkdp_filetypes = {'markdown'}

-- Set the default theme (dark or light). By default, the theme is defined according to system preferences
vim.g.mkdp_theme = 'dark'

-- Option to combine preview windows
vim.g.mkdp_combine_preview = 0

-- Automatically refetch combined preview contents when changing Markdown buffers (only applies if combine_preview is enabled)
vim.g.mkdp_combine_preview_auto_refresh = 1

-- Mapping for Markdown Preview in Lua for Neovim

-- Start Markdown Preview
vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>MarkdownPreview', {silent = true})

-- Stop Markdown Preview
vim.api.nvim_set_keymap('n', '<A-s>', '<Plug>MarkdownPreviewStop', {silent = true})

-- Toggle Markdown Preview
vim.api.nvim_set_keymap('n', '<C-p>', '<Plug>MarkdownPreviewToggle', {silent = true})
