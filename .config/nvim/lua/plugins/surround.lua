local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
}

function M.config()
  local surround = require("nvim-surround")

  surround.setup({
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "gs",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
    },
  })
end

return M
