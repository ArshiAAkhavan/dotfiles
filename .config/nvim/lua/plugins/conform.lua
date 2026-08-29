local M = {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  config = function()
    require("conform").setup(require "configs.conform")
  end,
}
return M
