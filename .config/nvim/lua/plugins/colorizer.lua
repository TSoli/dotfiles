local M = {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
}

function M.config()
  colorizer = require "colorizer"

  colorizer.setup()
end

return M
