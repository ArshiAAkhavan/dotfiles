local M = {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
    vim.diagnostic.config {
      float = { border = "rounded" },
    }
  end,
  mapping = function()
    vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, { desc = "Code action" })
    vim.keymap.set({ "n", "v" }, "gt", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "  toggle inlay_hint" })
    vim.keymap.set({ "n", "v" }, "gh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "  toggle inlay_hint" })
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next()
      vim.diagnostic.open_float()
    end)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev()
      vim.diagnostic.open_float()
    end)
  end,
}
return M
