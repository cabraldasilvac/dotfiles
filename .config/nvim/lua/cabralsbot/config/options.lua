-- lua/cabralsbot/config/options.lua

-- Define as opções globais e de janela para o Neovim.
-- Esses são os settings básicos para uma experiência de edição moderna.

-- Define o número de espaços para cada nível de identação.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Habilita o auto-indentação.
vim.opt.autoindent = true

-- Usa espaços em vez de tabulações.
vim.opt.expandtab = true

-- Define o número de linhas a serem saltadas com C-f/C-b.
vim.opt.scrolljump = 10

-- Habilita a numeração de linhas.
vim.opt.number = true

-- Habilita a numeração de linhas relativa.
vim.opt.relativenumber = true

-- Habilita a barra de status.
vim.opt.laststatus = 2

-- Define a exibição da barra de comando.
vim.opt.cmdheight = 1

-- Habilita a sintaxe colorida.
vim.opt.syntax = "on"

-- Habilita o realce da linha atual.
vim.opt.cursorline = true

-- Habilita o destaque da pesquisa.
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Mantém o cursor na posição central da tela ao mover.
vim.opt.scrolloff = 8

-- Exibe o modo atual na barra de status.
vim.opt.showmode = false

-- Configuração de backup e swap.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Habilita o mouse no modo normal, visual, insert e comando.
vim.opt.mouse = "a"

-- Configurações para o encoding.
vim.opt.encoding = "utf-8"
