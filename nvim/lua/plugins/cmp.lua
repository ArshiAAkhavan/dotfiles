local M = {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require "cmp"
    local nvchad_cmp = require "nvchad.configs.cmp"
    nvchad_cmp.window.documentation = cmp.config.window.bordered()
    return nvchad_cmp
  end,
}

return M
