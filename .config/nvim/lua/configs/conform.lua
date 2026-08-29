local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "golines", "gofumpt", "goimports" },
    rust = { "rustfmt" },
    python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
    ocaml = { "ocamlformat", "ocp-indent", stop_after_first = true },
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

return options
