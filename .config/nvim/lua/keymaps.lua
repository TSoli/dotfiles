-- Keymaps for vim

-- for default keybindings see :help index
-- for plugin/user keybindings see :map and :map!
-- to see where the keybindings are defined see :verbose-map
-- for more details see :help map
-- TODO: check out primeagen keymaps

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader =  " "
vim.g.maplocalleader =  " "

-- Modes
--  normal = "n"
--  insert = "i"
--  visual = "v"
--  visual block = "x"
--  term = "t"
--  command = "c"

-- Normal --
-- see :help normal-index for a full list of commands
-- see :nmap

local maps = {
  { "n", "<leader>e", ":Lex 30<CR>", "" },

  -- Better window navigation
  { "n", "<C-h>", "<C-w>h", "Window left" },
  { "n", "<C-j>", "<C-w>j", "Window down" },
  { "n", "<C-k>", "<C-w>k", "Window up" },
  { "n", "<C-l>", "<C-w>l", "Window right" },

  -- Resize with arrows
  { "n", "<C-Up>", ":resize +2<CR>", "Increase window height" },
  { "n", "<C-Down>", ":resize -2<CR>", "Decrease window height" },
  { "n", "<C-Left>", ":vertical resize -2<CR>", "Decrease window width" },
  { "n", "<C-Right>", ":vertical resize +2<CR>", "Increase window width" },

  -- Navigate buffers
  { "n", "<S-l>", ":bnext<CR>", "Next buffer" },
  { "n", "<S-h>", ":bprevious<CR>", "Previous buffer" },

  -- Clear highlights
  { "n", "<leader>h", "<cmd>nohlsearch<CR>", "Clear highlights" },

  -- Close buffers
  { "n", "<leader>q", "<cmd>Bdelete<CR>", "Close buffer" },

  -- Insert --
  -- see :help insert-index for a full list of commands
  -- see :imap
  { "i", "jk", "<ESC>", "Exit insert" },  -- exit insert with jk
  { "i", "kj", "<ESC>", "Exit insert" },  -- exit insert with kk

  -- Visual --
  -- see :help visual-index for a full list of commands
  -- see :vmap

  -- Stay in indent mode
  { "v", "<", "<gv", "Unindent" },
  { "v", ">", ">gv", "Indent" },

  -- Move text up and down
  { "v", "<A-j>", ":m .+1<CR>==", "Move text down" },
  { "v", "<A-k>", ":m .-2<CR>==", "Move text up" },

  -- keep the clipboard item when pasting over a word
  { "v", "p", '".dP', "Paste" },

  -- copy text
  { "v", "<C-C>", "<cmd>'<, '>w !clip.exe<CR>", "Copy text" },

  -- Visual Block --
  -- see :xmap

  -- Move text up and down
  -- { "x", "J", ":move '>+1<CR>gv-gv", "" },
  -- { "x", "K", ":move '<-2<CR>gv-gv", "" },
  { "x", "<A-j>", ":move '>+1<CR>gv-gv", "Move text down" },
  { "x", "<A-k>", ":move '<-2<CR>gv-gv", "Move text up" },

  -- copy text
  { "x", "<C-C>", "<cmd>'<, '>w !clip.exe<CR>", "Copy text" },

  -- Terminal --

  -- Open in a split
  { "n", "<leader>t", ":split<CR>:term<CR>", "Open terminal in split" },

  -- Plugins --

  -- NvimTree
  { "n", "<leader>e", ":NvimTreeToggle<CR>", "Open file explorer" },

  -- Telescope
  { "n", "<leader>ff", ":Telescope find_files<CR>", "Telescope: Find files" },
  { "n", "<leader>fg", ":Telescope live_grep<CR>", "Telescope: Find in cwd" },
  { "n", "<leader>fp", ":Telescope projects<CR>", "Telescope: Find projects" },
  { "n", "<leader>fb", ":Telescope buffers<CR>", "Telescope: Find buffers" },
  { "n", "<leader>fh", ":Telescope help_tags<CR>", "Telescope: Find help tags" },

  -- Git
  { "n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Toggle lazy git" },

  -- Comment
  { "n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment line" },
  { "x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "Comment selection" },

  -- Undotree
  { "n", "<leader>u", "<cmd>UndotreeToggle<CR>", "Undotree: Toggle" },

  -- DAP
  { "n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "DAP: Toggle breakpoint" },
  { "n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "DAP: Continue" },
  { "n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", "DAP: Step into" },
  { "n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", "DAP: Step over" },
  { "n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", "DAP: Step out" },
  { "n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "DAP: Toggle REPL" },
  { "n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", "DAP: Rerun last debug adapter" },
  { "n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", "DAPUI: Toggle DAPUI" },
  { "n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", "DAP: Terminate debug session" },

  -- Lsp
  { "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "LSP: Format file" },
}

local term_maps = {
  -- Terminal --
  -- Better terminal navigation
  { "t", "<C-h>", "<C-\\><C-N><C-w>h", "Window left" },
  { "t", "<C-j>", "<C-\\><C-N><C-w>j", "Window down" },
  { "t", "<C-k>", "<C-\\><C-N><C-w>k", "Window up" },
  { "t", "<C-l>", "<C-\\><C-N><C-w>l", "Window right" },
}

for _, map in ipairs(maps) do
  local mode, bind, cmd, description = unpack(map)
  keymap(mode, bind, cmd, { noremap = true, silent = true, desc = description })
end

for _, map in ipairs(term_maps) do
  local mode, bind, cmd, description = unpack(map)
  keymap(mode, bind, cmd, { silent = true, desc = description })
end
