-- Keymaps for vim

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Insert --
keymap("i", "jk", "<ESC>", opts)  -- exit insert with jk
