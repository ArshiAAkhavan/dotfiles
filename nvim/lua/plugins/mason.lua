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
      -- config & script languages
      "yaml-language-server",
      "json-lsp",
      "bash-language-server",
      -- "autotools-language-server",
      -- -- rust
      -- "rust_analyzer",
      "codelldb",
      -- go
      "gopls",
      -- python
      "black",
      "jedi-language-server",
      "pyright",
      "ruff",
      "reorder-python-imports",
      "debugpy",
    },
  },
}
return M
