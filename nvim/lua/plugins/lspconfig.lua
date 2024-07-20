local M = {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"
  end,
  mapping = function()
    vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, { desc = "Code action" })
  end,
}
return M
