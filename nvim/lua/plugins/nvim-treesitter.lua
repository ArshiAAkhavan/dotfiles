local M = {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      -- "rust",
      "go",
      "yaml",
      "json",
      "toml",
      "make",
      "c",
      "cpp",
      "bash",
    },
  },
}
return M
