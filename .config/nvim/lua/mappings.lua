require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- save on ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- copy all on ctrl+A
map({ "n", "i", "v" }, "<C-a>", "<cmd> %y+ <CR>")

map({ "n", "t" }, "<A-I>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
map({ "n", "t" }, "<A-Space>", function()
  require("nvchad.term").toggle { pos = "float", size = 15, id = "floatTerm" }
end, { desc = "terminal toggle horizontal term" })

-- -- remove mapping of <leader>h
vim.keymap.del("n", "<leader>h")

require("plugins.neotest").mapping()
require("plugins.dap").mapping()
require("plugins.lspconfig").mapping()
require("plugins.telescope").mapping()
require("plugins.markdown").mapping()
require("plugins.copilot").mapping()

-- nvim-tree has no buffer-local `gx`, so nvim's default one runs and falls back to
-- expand("<cfile>") -- which in a rendered tree is an indent guide, a devicon, or a
-- bare basename resolved against cwd. Use the node's absolute path instead.
-- vim.ui.open already detaches; we skip the default mapping's cmd:wait(1000), which
-- reports a bogus timeout when the handler is slow to fork.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function(ev)
    map("n", "gx", function()
      local node = require("nvim-tree.api").tree.get_node_under_cursor()
      if not node or not node.absolute_path then
        return
      end
      local _, err = vim.ui.open(node.absolute_path)
      if err then
        vim.notify(err, vim.log.levels.ERROR)
      end
    end, { buffer = ev.buf, desc = "nvim-tree open with system handler" })
  end,
})
