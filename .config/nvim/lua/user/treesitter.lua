local configs = require("nvim-treesitter.configs")
-- define new highlight colors
-- vim.cmd("highlight TSRainbowTest guifg=#ffffff ctermfg=White")

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  autopairs = { enable = true, },
  autotag = { enable = true, },
  endwise = { enable = true, },
  indent = { enable = true, disable = { "" }, },
  rainbow = {
    enable = true,
     -- list of languages you want to disable the plugin for
    disable = { },
    -- Which query to use for finding delimiters
    query = {
      "rainbow-parens",
      html = "rainbow-tags",
      latex = "rainbow-blocks",
      javascript = "rainbow-tags-react",
      tsx = "rainbow-tags",
    },
    -- Highlight the entire buffer all at once
    strategy = require("ts-rainbow").strategy.global,
    -- bracket highlight colors in order
    hlgroups = {
      "TSRainbowRed",
      "TSRainbowYellow",
      "TSRainbowBlue",
      "TSRainbowOrange",
      "TSRainbowGreen",
      "TSRainbowViolet",
      "TSRainbowCyan"
    },
  }
}
