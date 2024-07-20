return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "BufWritePre", -- uncomment for format on save
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      require("dap-go").setup()
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup {
        highlight_changed_variables = true,
        only_first_definition = false,
        all_references = false,
        show_stop_reason = true,
      }

      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = dapui.open
      dap.listeners.before.event_terminated.dapui_config = dapui.close
      dap.listeners.before.event_exited.dapui_config = dapui.close
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "  dap continue" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "  dap step into" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "  dap step over" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = " 󰆸 dap step out" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "  dap continue" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "  dap step into" })
      vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "  dap step over" })
      vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = " 󰆸 dap step out" })
      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "  toggle breakpoint" })
      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "  toggle breakpoint" })
      vim.keymap.set("n", "<Leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
      end)
      vim.keymap.set("n", "<Leader>dr", dap.repl.open)
      vim.keymap.set("n", "<Leader>dl", dap.run_last)
      vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
        require("dap.ui.widgets").hover()
      end)
      vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
        require("dap.ui.widgets").preview()
      end)
      vim.keymap.set("n", "<Leader>df", function()
        local widgets = require "dap.ui.widgets"
        widgets.centered_float(widgets.frames)
      end)
      vim.keymap.set("n", "<Leader>ds", function()
        local widgets = require "dap.ui.widgets"
        widgets.centered_float(widgets.scopes)
      end)
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
          map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "   toggle stage hunk" })
          map("n", "<leader>hr", gitsigns.reset_hunk, { desc = " reset hunk" })
          map("v", "<leader>hs", function()
            gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
          end, { desc = "  toggle stage hunk" })
          map("v", "<leader>hr", function()
            gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end, { desc = " reset hunk" })
          map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "   toggle stage buffer" })
          map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = " undo stage hunk" })
          map("n", "<leader>hR", gitsigns.reset_buffer, { desc = " reset buffer" })
          map("n", "<leader>hp", gitsigns.preview_hunk, { desc = " preview hunk" })
          map("n", "<leader>hb", function()
            gitsigns.blame_line { full = true }
          end, { desc = " git blame" })
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "   toggle git blame" })
          map("n", "<leader>hd", gitsigns.diffthis, { desc = " git diff" })
          map("n", "<leader>hD", function()
            gitsigns.diffthis "~"
          end, { desc = " git diff" })
          map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "   toggle deleted" })

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
