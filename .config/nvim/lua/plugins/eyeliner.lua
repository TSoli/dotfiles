local M = {
  "jinh0/eyeliner.nvim",
  event = "VeryLazy",
}

function M.config()
  eyeliner = require("eyeliner")

  -- set up custom highlighting
  -- vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#000000', bold = true, underline = true })
  -- vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#ffffff', underline = true })

  eyeliner.setup({
    highlight_on_key = true, -- show highlights only after keypress
    dim = true,             -- dim all other characters if set to true (recommended!)
  })
end

return M
