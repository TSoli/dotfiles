-- required to set a theme below
vim.o.background = nil

require("kanagawa").setup({
  commentStyle = { },
  keywordStyle = { },
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
    }
  end,
})

vim.cmd("colorscheme kanagawa")
