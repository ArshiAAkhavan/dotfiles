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
  -- ocaml
  "ocamllsp",
}


-- init.lua / lua/plugins/lsp.lua
-- local lsp = require("lspconfig")
-- C++ via clangd
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=never",
    "--compile-commands-dir=build", -- omit if you created the symlink at project root
    -- Useful if you cross-compile or use nonstandard compilers:
    -- "--query-driver=/usr/bin/clang++,/usr/bin/g++,/opt/*/bin/*"
  },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp' },
}

vim.lsp.inlay_hint.enable(true)
vim.lsp.enable(servers)
