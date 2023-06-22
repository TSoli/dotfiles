local M = {
  "rebelot/kanagawa.nvim",
  lazy = false,     -- make sure we load this during startup if it is chosen colorscheme
  priority = 1000,  -- make sure to load this before all the other start plugins
}

-- used for :colorscheme <name>
M.name = "kanagawa"


function M.config()
  local kanagawa = require(M.name)

  -- required to set a theme below
  vim.o.background = nil

  kanagawa.setup({
    commentStyle = { italic = true, },
    functionStyle = {},
    keywordStyle = { italic = true, },
    statementStyle = { bold = true, },
    typeStyle = {},
    theme = "dragon",
    overrides = function(colors)
      return {
        -- For ts-rainbow2 bracket coloring
        TSRainbowRed = { fg = colors.palette.dragonRed },
        TSRainbowYellow = { fg = colors.palette.autumnYellow },
        TSRainbowBlue = { fg = colors.palette.springBlue },
        TSRainbowOrange = { fg = colors.palette.surimiOrange },
        TSRainbowGreen = { fg = colors.palette.springGreen },
        TSRainbowViolet = { fg = colors.palette.oniViolet },
        TSRainbowCyan = { fg = colors.palette.waveAqua1 },

        -- for line numbers
        CursorLineNr = { fg = colors.palette.dragonOrange, },
      }
    end,
  })

  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    vim.notify("Could not set '" .. M.name .. "' colorscheme.")
  end
end

return M
