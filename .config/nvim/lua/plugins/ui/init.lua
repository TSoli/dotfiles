local M = {}
local ui_plugins = {
	"alpha",
	"bufferline",
	"colorizer",
	"eyeliner",
	"flash",
	"gitsigns",
	"illuminate",
	"indentline",
	"lualine",
	"noice",
	"nvim-tree",
	"rainbow-delimiters",
	"scrollbar",
	"statuscol",
	"tmux-navigator",
	"todo-comments",
	"toggleterm",
	"trouble",
	"ufo",
	"which-key",
}

for _, v in ipairs(ui_plugins) do
	table.insert(M, require("plugins.ui." .. v))
end

return M
