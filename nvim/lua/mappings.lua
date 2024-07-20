require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, { desc = "Code action" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

require("plugins.neotest").mapping()
require("plugins.dap").mapping()
