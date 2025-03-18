local M = {
  'saecki/crates.nvim',
  tag = 'stable',
  ft = { 'toml' },
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    local nvlsp = require "nvchad.configs.lspconfig"

    require('crates').setup {
      lsp = {
        enabled = true,

        on_attach = nvlsp.on_attach,
        actions = true,
        completion = true,
        hover = true,
      },
      completion = {
        cmp = {
          enabled = true,
        },
      },
      require("cmp").setup.buffer({
        sources = { { name = "crates" } }
      })
    }
  end,
}
return M
