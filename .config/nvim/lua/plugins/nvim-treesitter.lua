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
      -- python
      "python",
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
      "csv",
      -- C
      "make",
      "cmake",
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
    vim.api.nvim_set_hl(
      0,
      "@keyword.operator",
      { fg = "#e67e80", bg = "", italic = false, underline = false, sp = "" }
    )

    -- documentation colors
    vim.api.nvim_set_hl(
      0,
      "@comment.documentation",
      -- { fg = "#d08e6e", bg = "", italic = false, underline = false, sp = "" }
      { fg = "#966F5D", bg = "", italic = false, underline = false, sp = "" }
      -- { fg = "#6F5950", bg = "", italic = false, underline = false, sp = "" }
    )

    opts.playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      }
    require("nvim-treesitter.configs").setup(opts)
  end,
}
return M
