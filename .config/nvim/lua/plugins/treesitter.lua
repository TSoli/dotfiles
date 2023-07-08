-- Treesitter
local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",                       -- colour brackets

    {
      "windwp/nvim-autopairs",                        -- auto close brackets/quotes
      event = "VeryLazy",
    },
    {
      "windwp/nvim-ts-autotag",                       -- autoclose/rename tags
      event = "VeryLazy",
    },
    {
      "RRethy/nvim-treesitter-endwise",               -- smart end in languages like lua
      event = "VeryLazy",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",  -- smart commenting
      event = "VeryLazy",
    },
    {
      "nvim-tree/nvim-web-devicons",                  -- nice icons for nvim-tree
      event = "VeryLazy",
    },
  },
}

function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    -- put the language you want in this array
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
      "bash",
      "python",
      "javascript",
      "typescript",
      "tsx",
    },
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "latex" },     -- List of parsers to ignore installing
    sync_install = false,        -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      -- disable = { "css" }, -- list of language that will be disabled
    },
    indent = { enable = true,
    -- disable = { "python", "css" },
    },

    autopairs = { enable = true, },
    autotag = { enable = true, },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },

    endwise = { enable = true, },

    rainbow = {
      enable = true,
       -- list of languages you want to disable the plugin for
      disable = { "latex" },
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
      -- define new highlight colors
      -- vim.cmd("highlight TSRainbowTest guifg=#ffffff ctermfg=White")
      hlgroups = {
        "TSRainbowRed",
        "TSRainbowYellow",
        "TSRainbowBlue",
        "TSRainbowOrange",
        "TSRainbowGreen",
        "TSRainbowViolet",
        "TSRainbowCyan"
      },
    },
  }
end

return M
