local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- language adapters
    "nvim-neotest/neotest-go",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local neotest = require "neotest"
    neotest.setup {
      adapters = {
        require "neotest-go",
        require "neotest-rust",
        require "neotest-python",
      },
    }
  end,

  mapping = function()
    local neotest = require "neotest"
    -- keymaps
    vim.keymap.set("n", "]t", neotest.jump.next, { desc = "󰤑  test next" })
    vim.keymap.set("n", "[t", neotest.jump.prev, { desc = "󰤑  test prev" })
    vim.keymap.set("n", "]f", function()
      neotest.jump.next { status = "failed" }
    end, { desc = "󰤑   test next failed" })
    vim.keymap.set("n", "[f", function()
      neotest.jump.prev { status = "failed" }
    end, { desc = "󰤑   test prev failed" })
    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "󰤑   test summary" })
    vim.keymap.set("n", "<leader>to", neotest.output_panel.toggle, { desc = "󰤑   test output" })
    vim.keymap.set("n", "<leader>tt", neotest.run.run, { desc = "󰤑  test run" })
    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand "%")
    end, { desc = "󰤑  test file" })
    vim.keymap.set("n", "<leader>ty", function()
      neotest.run.run { strategy = "dap" }
    end, { desc = "󰤑   test debug" })
  end,
}

return M
