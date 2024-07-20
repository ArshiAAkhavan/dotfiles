local M = {
  "nvim-neotest/neotest",
  event = "BufWritePre", -- uncomment for format on save
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
  },
  config = function()
    local neotest = require "neotest"
    neotest.setup {
      adapters = {
        require "neotest-go",
      },
    }
  end,
}

return M
