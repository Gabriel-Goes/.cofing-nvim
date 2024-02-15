print("Carregando ZettelVim ...")

local core_path = "/home/ggrl/projetos/ZettelVim/core?.lua;"
local testes_path = "/home/ggrl/projetos/ZettelVim/testes?.lua;"

package.path = core_path .. testes_path .. package.path

require('init')
