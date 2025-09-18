-- Lista de plugins e bootstrap do Lazy.nvim
-- Este módulo inicializa o gerenciador de plugins e agrega as coleções

local fn = vim.fn

-- Bootstrap do Lazy.nvim (instala automaticamente se não existir)
local lazy_path = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end
vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
  -- Plugins Essenciais
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Opções: latte, frappe, macchiato, mocha
        transparent_background = false,
        styles = {
          comments = { "italic" },
          functions = { "bold" },
          keywords = { "italic" },
        },
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  -- Navegação de arquivos
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    cmd = "NvimTreeToggle",
  },
  -- Telescope para busca
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", "package-lock.json" },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Buscar arquivos" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Buscar texto" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Listar buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Buscar ajuda" })
    end,
  },
  -- Treesitter para realce de sintaxe
 {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "json", "css", "html" },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  -- Autocompletar com nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
  -- Comentar linhas
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>cl",
          block = "<leader>cb",
        },
        opleader = {
          line = "<leader>cl",
          block = "<leader>cb",
        },
      })
    end,
  },
-- Barras de Status - lualine
   {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "NvimTree", "lazy" },
          always_active_filetypes = { "neo-tree" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "nvim-tree", "lazy" },
      })
    end,
  },
})
