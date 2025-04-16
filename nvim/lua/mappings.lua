require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- save on ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- copy all on ctrl+A
map({ "n", "i", "v" }, "<C-a>", "<cmd> %y+ <CR>")

-- remove mapping of <leader>h 
vim.keymap.del('n', '<leader>h')


require("plugins.neotest").mapping()
require("plugins.dap").mapping()
require("plugins.lspconfig").mapping()
require("plugins.telescope").mapping()
require("plugins.markdown").mapping()
require("plugins.copilot").mapping()
