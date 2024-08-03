local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    -- language supports
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("dap-go").setup()
    require("dap-python").setup "python"
    require("dapui").setup()
    require("telescope").load_extension "dap"
    require("nvim-dap-virtual-text").setup {
      highlight_changed_variables = true,
      only_first_definition = false,
      all_references = false,
      show_stop_reason = true,
    }
    -- rust
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "/home/ark/.local/share/nvim/mason/bin/codelldb", -- adjust as needed, must be absolute path
        args = { "--port", "${port}" },
      },
    }
    dap.configurations.rust = {
      {
        -- ... the previous config goes here ...,
        initCommands = function()
          -- Find out where to look for the pretty printer Python module
          local rustc_sysroot = vim.fn.trim(vim.fn.system "rustc --print sysroot")

          local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
          local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

          local commands = {}
          local file = io.open(commands_file, "r")
          if file then
            for line in file:lines() do
              table.insert(commands, line)
            end
            file:close()
          end
          table.insert(commands, 1, script_import)

          return commands
        end,
        -- ...,
      },
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
  end,
  mapping = function()
    local dap = require "dap"
    local dapui = require "dapui"
    local dapvir = require "nvim-dap-virtual-text"
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
    vim.keymap.set("n", "<Leader>dv", dapvir.toggle, { desc = "  toggle virtual text" })
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
