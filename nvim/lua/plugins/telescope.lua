local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-ui-select.nvim",
    "jonarrien/telescope-cmdline.nvim",
  },
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)
    telescope.load_extension "ui-select"
    telescope.load_extension "cmdline"
  end,
  mapping = function()
    vim.api.nvim_set_keymap("n", ":", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
    vim.api.nvim_set_keymap("n", ";", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
  end,
}
return M
