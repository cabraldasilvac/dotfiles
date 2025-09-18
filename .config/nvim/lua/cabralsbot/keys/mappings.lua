
-- lua/cabralsbot/keys/mappings.lua

-- Define mapeamentos de teclado personalizados para o Neovim.
-- Use <leader> para atalhos de teclado mais fáceis.
-- Define a tecla <leader> como a barra de espaço.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

---------- General Keymaps -------------------
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "save file" })
-- Select all text in current buffer
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>")
vim.keymap.set("n", "<leader>bd", ":bd!<cr>", { desc = "Close current buffer" })
vim.keymap.set("", "<leader>rr", ":source %<cr>", { desc = "Source the current file" })
--
vim.keymap.set("v", ">", ">gv", { desc = "after tab in re-select the same" })
vim.keymap.set("v", "<", "<gv", { desc = "after tab out re-select the same" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Goes to the next result on the seach and put the cursor in the middle" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Goes to the prev result on the seach and put the cursor in the middle" })
-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')
-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
--
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- Clean Search
vim.keymap.set("n", "<esc>", ":noh<return><esc>")
vim.keymap.set("n", "<up>", "<nop>", { noremap = true })
vim.keymap.set("n", "<down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<right>", "<nop>", { noremap = true })
--
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")
-- Docker
vim.keymap.set("n", "<leader>dps", ":DockerPS<CR>", { desc = "Docker: Listar contêineres (popup)" })
vim.keymap.set("n", "<leader>dpsi", ":DockerPSSimple<CR>", { desc = "Docker: Listar contêineres (terminal)" })
vim.keymap.set("n", "<leader>dim", ":DockerImages<CR>", { desc = "Docker: Listar imagens (popup)" })
-- Telescope
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, vim.tbl_extend("force", opts, { desc = "Arquivos do projeto" }))
vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, vim.tbl_extend("force", opts, { desc = "Grep no projeto" }))
vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, vim.tbl_extend("force", opts, { desc = "Buffers abertos" }))
vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, vim.tbl_extend("force", opts, { desc = "Ajuda" }))

