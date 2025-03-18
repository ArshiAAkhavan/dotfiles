local M = {
"ldelossa/nvim-dap-projects",
  config = function ()
    require('nvim-dap-projects').config_paths = {"./.nvim/dap.lua"}
  end,
}

return M
