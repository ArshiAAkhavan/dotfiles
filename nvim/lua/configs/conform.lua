local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "golines", { "gofumpt", "gofmt" }, "goimports" },
    rust = { "rustfmt" },
    python = { { "ruff_format", "black" }, "ruff_fix", { "ruff_organize_imports", "reorder-python-imports" } },
    ["_"] = { "trim_whitespace" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
