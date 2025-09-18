-- lua/cabralsbot/init.lua

-- Carrega as opções de configuração gerais do Neovim.
-- Inclui configurações como números de linha, identação, etc.
require("cabralsbot.config.options")

-- Carrega o gerenciador de plugins Lazy.nvim e a lista de plugins.
-- As configurações de cada plugin estão aqui.
require("cabralsbot.plugins")

-- Carrega os mapeamentos de teclado personalizados.
-- Atalhos de teclado para funções e plugins.
require("cabralsbot.keys.mappings")

-- Exibe uma mensagem de boas-vindas ao iniciar o Neovim,
-- mostrando que a configuração foi carregada com sucesso.
vim.api.nvim_echo({ { "Neovim configuration loaded successfully!", "MoreMsg" } }, false, {})
