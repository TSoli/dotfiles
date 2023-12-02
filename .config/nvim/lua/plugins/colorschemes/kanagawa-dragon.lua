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
      local utils = require("plugins.colorschemes.utils")
      local bg = colors.theme.ui.bg
      return {
        -- For rainbow-delimiters coloring
        RainbowDelimiterRed = { fg = colors.palette.dragonRed },
        RainbowDelimiterYellow = { fg = colors.palette.autumnYellow },
        RainbowDelimiterBlue = { fg = colors.palette.springBlue },
        RainbowDelimiterOrange = { fg = colors.palette.surimiOrange },
        RainbowDelimiterGreen = { fg = colors.palette.springGreen },
        RainbowDelimiterViolet = { fg = colors.palette.oniViolet },
        RainbowDelimiterCyan = { fg = colors.palette.waveAqua1 },

        -- For backgrounds
        RainbowDelimiterBGRed = { bg = utils.blend_colors(colors.palette.dragonRed, bg, 0.2) },
        RainbowDelimiterBGYellow = { bg = utils.blend_colors(colors.palette.autumnYellow, bg, 0.2) },
        RainbowDelimiterBGBlue = { bg = utils.blend_colors(colors.palette.springBlue, bg, 0.2) },
        RainbowDelimiterBGOrange = { bg = utils.blend_colors(colors.palette.surimiOrange, bg, 0.2) },
        RainbowDelimiterBGGreen = { bg = utils.blend_colors(colors.palette.springGreen, bg, 0.2) },
        RainbowDelimiterBGViolet = { bg = utils.blend_colors(colors.palette.oniViolet, bg, 0.2) },
        RainbowDelimiterBGCyan = { bg = utils.blend_colors(colors.palette.waveAqua1, bg, 0.2) },

        -- for line numbers
        CursorLineNr = { fg = colors.palette.dragonOrange, },

        -- ruler colour
        ColorColumn = { bg = colors.palette.winterRed }
      }
    end,
  })

  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    vim.notify("Could not set '" .. M.name .. "' colorscheme.")
  end

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M
