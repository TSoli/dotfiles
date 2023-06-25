-- Highlight instances of words as the cursor hovers on them
local M = {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
}

function M.config()
  local illuminate = require "illuminate"
  vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
  vim.api.nvim_set_keymap(
    "n",
    "<a-n>",
    '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
    { noremap = true, desc = "Go to previous reference" }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<a-p>",
    '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
    { noremap = true, desc = "Go to next reference" }
  )

  illuminate.configure {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 200,
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "packer",
      "neogitstatus",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
  }

  -- change the highlight style
  -- vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorLine" })
  -- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorLine" })
  -- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })
end

return M
