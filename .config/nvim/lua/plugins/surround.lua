local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
}

function M.config()
  local surround = require("nvim-surround")

  surround.setup({})
end

return M
