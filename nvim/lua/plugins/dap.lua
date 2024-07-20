local M = {
  "mfussenegger/nvim-dap",
  event = "BufWritePre", -- uncomment for format on save
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("dap-go").setup()
    require("dapui").setup()
    require("telescope").load_extension "dap"
    require("nvim-dap-virtual-text").setup {
      highlight_changed_variables = true,
      only_first_definition = false,
      all_references = false,
      show_stop_reason = true,
    }

    -- attach dapui to dap
    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close
    dap.listeners.before.event_exited.dapui_config = dapui.close

    -- signs
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )

    -- keymaps
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "  dap continue" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "  dap step into" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "  dap step over" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = " 󰆸 dap step out" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "  dap continue" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "  dap step into" })
    vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "  dap step over" })
    vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = " 󰆸 dap step out" })
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "  toggle breakpoint" })
    vim.keymap.set("n", "<Leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
    end)
    vim.keymap.set("n", "<Leader>dr", function()
      dapui.open { reset = true }
    end, { desc = "  dapui reset" })
    vim.keymap.set("n", "<Leader>dt", dapui.toggle, { desc = "  dapui toggle" })
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
}

return M
