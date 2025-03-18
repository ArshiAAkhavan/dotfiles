local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "ldelossa/nvim-dap-projects",
    -- language adapters
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("dapui").setup()
    require("telescope").load_extension "dap"
    require("nvim-dap-virtual-text").setup {
      highlight_changed_variables = true,
      only_first_definition = false,
      all_references = false,
      show_stop_reason = true,
    }

    require("dap-go").setup()
    require("dap-python").setup "python"
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
        request = "launch",
        type = "codelldb",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
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
    local dap_ui_widgets = require "dap.ui.widgets"
    local dapvir = require "nvim-dap-virtual-text"
    local dapprojects = require "nvim-dap-projects"
    -- keymaps
    local map = vim.keymap.set
    map("n", "<F5>", function()
      dapprojects.search_project_config()
      dap.continue()
    end, { desc = "  dap continue" })
    map("n", "<F11>", dap.step_into, { desc = "  dap step into" })
    map("n", "<F10>", dap.step_over, { desc = "  dap step over" })
    map("n", "<F12>", dap.step_out, { desc = " 󰆸 dap step out" })
    -- map("n", "<leader>dc", dap.continue, { desc = "  dap continue" })
    map("n", "<leader>dc", function()
      dapprojects.search_project_config()
      dap.continue()
    end, { desc = "  dap continue" })

    map("n", "<leader>di", dap.step_into, { desc = "  dap step into" })
    map("n", "<leader>dj", dap.step_over, { desc = "  dap step over" })
    map("n", "<leader>dk", dap.step_out, { desc = " 󰆸 dap step out" })
    map("n", "<Leader>db", dap.toggle_breakpoint, { desc = "  toggle breakpoint" })
    map("n", "<Leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
    end)
    map("n", "<Leader>dr", function()
      dapui.open { reset = true }
    end, { desc = " ⟳ dapui reset" })
    map("n", "<Leader>dt", dapui.toggle, { desc = "  dapui toggle" })
    map("n", "<Leader>dv", dapvir.toggle, { desc = "  toggle virtual text" })
    map("n", "<Leader>dl", dap.run_last)

    map({ "n", "v" }, "<Leader>dh", dap_ui_widgets.hover, { desc = "  dapui hover" })
    map({ "n", "v" }, "<Leader>dp", dap_ui_widgets.preview, { desc = " 📹 dapui preview" })
    map("n", "<Leader>df", function()
      dap_ui_widgets.centered_float(dap_ui_widgets.frames)
    end, { desc = " 🎞️ dapui frames" })
    map("n", "<Leader>ds", function()
      dap_ui_widgets.centered_float(dap_ui_widgets.scopes)
    end, { desc = " 🥣 dapui scopes" })
  end,
}

return M
