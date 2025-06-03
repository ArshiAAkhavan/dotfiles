-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"

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
  "jedi_language_server",
  "pyright",
  "ruff",
  -- cpp 
  "clangd",
}

vim.lsp.inlay_hint.enable(true)

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
