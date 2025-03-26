local M = {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    local nvlsp = require "nvchad.configs.lspconfig"

    vim.g.rustaceanvim = {
      -- LSP configuration
      server = {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      },
    }
  end
}

return M
