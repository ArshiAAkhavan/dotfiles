-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- lua
  "lua_ls",
  -- web
  "html",
  "cssls",
  -- config & scripts
  "yamlls",
  "jsonls",
  -- "autotools_ls",
  "bashls",
  -- not rust config since it has been setup by rustacean.nvim
  -- rust
  -- "rust_analyzer",
  -- go
  "gopls",
  -- python
  -- "jedi_language_server",
  "pyright",
  "ruff",
  -- cpp 
  "clangd",
}

vim.lsp.inlay_hint.enable(true)
vim.lsp.enable(servers)

