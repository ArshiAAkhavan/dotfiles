return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gitsigns = require "gitsigns"

          local function map(mode, l, r, opts, desc)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts, desc)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal { "]c", bang = true }
            else
              gitsigns.nav_hunk "next"
            end
          end, { desc = " next change" })

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal { "[c", bang = true }
            else
              gitsigns.nav_hunk "prev"
            end
          end, { desc = " previous change" })

          -- Actions
          map("n", "<leader>hs", gitsigns.stage_hunk,{desc="   toggle stage hunk"})
          map("n", "<leader>hr", gitsigns.reset_hunk,{desc=" reset hunk"})
          map("v", "<leader>hs", function()
            gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
          end,{desc="  toggle stage hunk"})
          map("v", "<leader>hr", function()
            gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end,{desc=" reset hunk"})
          map("n", "<leader>hS", gitsigns.stage_buffer,{desc="   toggle stage buffer"})
          map("n", "<leader>hu", gitsigns.undo_stage_hunk,{desc=" undo stage hunk"})
          map("n", "<leader>hR", gitsigns.reset_buffer,{desc=" reset buffer"})
          map("n", "<leader>hp", gitsigns.preview_hunk,{desc=" preview hunk"})
          map("n", "<leader>hb", function()
            gitsigns.blame_line { full = true }
          end,{desc=" git blame"})
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame,{desc="   toggle git blame"})
          map("n", "<leader>hd", gitsigns.diffthis,{desc=" git diff"})
          map("n", "<leader>hD", function()
            gitsigns.diffthis "~"
          end,{desc=" git diff"})
          map("n", "<leader>td", gitsigns.toggle_deleted,{desc="   toggle deleted"})

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        -- lua
        "lua-language-server",
        "stylua",
        -- web
        "html-lsp",
        "css-lsp",
        -- terminal
        "yaml-language-server",
        "json-lsp",
        "bash-language-server",
        -- -- rust
        -- "rust_analyzer",
        -- go
        "gopls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "rust",
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
  },
}
