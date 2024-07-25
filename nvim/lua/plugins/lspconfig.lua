local M = {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"
  end,
  mapping = function()
    vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, { desc = "Code action" })
    vim.keymap.set({ "n", "v" }, "gt", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "  toggle inlay_hint" })
    vim.keymap.set({ "n", "v" }, "gh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "  toggle inlay_hint" })
  end,
}
return M
