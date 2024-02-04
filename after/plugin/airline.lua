print("Carregando configurações do Airline")
-- Configurações do air-line
vim.g.airline_theme = 'base16_gruvbox_dark_medium'

vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'

-- Configurações do lightline
vim.g.airline_powerline_fonts = 1
