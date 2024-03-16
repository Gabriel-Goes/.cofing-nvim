-- Configurações do air-line
-- Tema Gruvbox
vim.g.airline_theme = 'term'
vim.g.airline_powerline_fonts = 1
vim.g["airline#extensions#tabline#left_sep"] = ' '
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
vim.g["airline#extensions#tabline#show_tabtype"] = 1
vim.g["airline#extensions#tabline#enabled"] = 1
-- Set airline branch symbol to ''
vim.g["airline#extensions#branch#symbol"] = ''
-- if branch has uncommitted changes
-- Set airline dirty symbol to '✗'
vim.g["airline#extensions#branch#dirty"] = '✗'
-- if branch is ahead of remote
-- Set airline ahead symbol to '↑'
vim.g["airline#extensions#branch#ahead"] = '↑'
