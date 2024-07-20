local M = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "prettier",
      -- lua
      "lua-language-server",
      "stylua",
      -- web
      "html-lsp",
      "css-lsp",
      -- terminal
      "yaml-language-server",
      "json-lsp",
      "bash-language-server",
      -- -- rust
      -- "rust_analyzer",
      -- go
      "gopls",
    },
  },
}
return M
