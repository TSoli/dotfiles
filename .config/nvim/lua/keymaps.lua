-- Keymaps for vim

-- for default keybindings see :help index
-- for plugin/user keybindings see :map and :map!
-- to see where the keybindings are defined see :verbose-map
-- for more details see :help map
-- TODO: check out primeagen keymaps

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
	{ "n", "<leader>bd", "<cmd>Bdelete<CR>", "Close buffer" },

	{ "n", "J", "mzJ`z", "Append line below" }, -- stops cursor from moving

	-- Keep cursor in the middle while paging up/down and searching
	{ "n", "<C-d>", "<C-d>zz", "Page down" },
	{ "n", "<C-u>", "<C-u>zz", "Page up" },
	{ "n", "n", "nzzzv", "Next search" },
	{ "n", "N", "Nzzzv", "Previous search" },

	-- Insert --
	-- see :help insert-index for a full list of commands
	-- see :imap
	{ "i", "jk", "<ESC>", "Exit insert" }, -- exit insert with jk
	{ "i", "kj", "<ESC>", "Exit insert" }, -- exit insert with kj

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

	-- Visual Block --
	-- see :xmap

	-- Move text up and down
	{ "x", "J", ":move '>+1<CR>gv-gv", "" },
	{ "x", "K", ":move '<-2<CR>gv-gv", "" },
	{ "x", "<A-j>", ":move '>+1<CR>gv-gv", "Move text down" },
	{ "x", "<A-k>", ":move '<-2<CR>gv-gv", "Move text up" },

	-- copy text
	{ "x", "<leader>p", '"_dP', "Paste over word (delte to void)" }, -- adds deleted word to void register instead
	{ "n", "<leader>y", '"+y', "Copy to system clipboard" },
	{ "n", "<leader>Y", '"+Y', "Copy to system clipboard" },
	{ "v", "<leader>y", '"+y', "Copy to system clipboard" },

	-- delete to void register
	{ "n", "<leader>d", '"_d', "Delete to void" },
	{ "v", "<leader>d", '"_d', "Delete to void" },

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
	{ "n", "<leader>fj", ":Telescope jumplist<CR>", "Telescope: Find jumplist" },

	-- Git
	{ "n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Toggle lazy git" },

	-- Comment
	{ "n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment line" },
	{
		"x",
		"<leader>/",
		"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		"Comment selection",
	},

	-- Undotree
	-- { "n", "<leader>u", "<cmd>UndotreeToggle<CR>", "Undotree: Toggle" },
	{ "n", "<leader>u", "<cmd>Telescope undo<CR>", "Telescope: undo" },

	-- DAP
	{ "n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "DAP: Toggle breakpoint" },
	{ "n", "<leader>bc", "<cmd>lua require'dap'.continue()<cr>", "DAP: Continue" },
	{ "n", "<leader>bi", "<cmd>lua require'dap'.step_into()<cr>", "DAP: Step into" },
	{ "n", "<leader>bo", "<cmd>lua require'dap'.step_over()<cr>", "DAP: Step over" },
	{ "n", "<leader>bO", "<cmd>lua require'dap'.step_out()<cr>", "DAP: Step out" },
	{ "n", "<leader>br", "<cmd>lua require'dap'.repl.toggle()<cr>", "DAP: Toggle REPL" },
	{ "n", "<leader>bl", "<cmd>lua require'dap'.run_last()<cr>", "DAP: Rerun last debug adapter" },
	{ "n", "<leader>bu", "<cmd>lua require'dapui'.toggle()<cr>", "DAPUI: Toggle DAPUI" },
	{ "n", "<leader>bt", "<cmd>lua require'dap'.terminate()<cr>", "DAP: Terminate debug session" },

	-- Lsp
	{ "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "LSP: Format file" },

	-- zk
	-- see ftplugin/markdown for more keymaps
	-- Create a new note after asking for its title.
	{ "n", "<leader>nn", "<Cmd>ZkNew { title = vim.fn.input('Title 󰙏 ') }<CR>", "zk: Create New note" },
	-- Open notes.
	{ "n", "<leader>nr", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "zk: Notes recent" },
	-- Open notes associated with the selected tags.
	{ "n", "<leader>nt", "<Cmd>ZkTags<CR>", "zk: Search notes by Tag" },
	-- Search for the notes matching a given query.
	{
		"n",
		"<leader>nf",
		"<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search 󰙏 ') } }<CR>",
		"zk: Note Find",
	},
	-- Search for the notes matching the current visual selection.
	{ "v", "<leader>nf", ":'<,'>ZkMatch<CR>", "zk: Note Find" },

	-- Open the notes index file
	{ "n", "<leader>ni", "<Cmd>ZkOpenIndex<CR>", "zk: open Notes Index" },
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
