local M = {
  "MeanderingProgrammer/markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
  },
  config = function()
    local markdown = require "render-markdown"
    markdown.setup {}
    markdown.enable()
  end,
  mapping = function()
    local markdown = require "render-markdown"
    vim.keymap.set("n", "<Leader>rm", markdown.toggle, { desc = "  markdown render toggle" })
  end,
}
return M
