local M = {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- vim/nvim
      "vim",
      "lua",
      "vimdoc",
      -- web
      "html",
      "css",
      -- rust
      "rust",
      -- go
      "go",
      "gomod",
      "gosum",
      -- config languages
      "yaml",
      "json",
      "toml",
      -- C
      "make",
      "c",
      "cpp",
      -- terminal
      "bash",
    },
  },
  config = function(_, opts)
    -- punctuation colors
    vim.api.nvim_set_hl(0, "@punctuation", { fg = "#e67e80", bg = "", italic = false, underline = false, sp = "" })
    vim.api.nvim_set_hl(
      0,
      "@punctuation.delimiter",
      { fg = "#e67e80", bg = "", italic = false, underline = false, sp = "" }
    )
    vim.api.nvim_set_hl(
      0,
      "@punctuation.bracket",
      { fg = "#e67e80", bg = "", italic = false, underline = false, sp = "" }
    )

    -- documentation colors
    vim.api.nvim_set_hl(
      0,
      "@comment.documentation",
      { fg = "#d08e6e", bg = "", italic = false, underline = false, sp = "" }
    )
    require("nvim-treesitter.configs").setup(opts)
  end,
}
return M
