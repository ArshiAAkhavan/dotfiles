-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
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
  -- rust
  "rust_analyzer",
  -- go
  "gopls",
}

vim.lsp.inlay_hint.enable(true)

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
