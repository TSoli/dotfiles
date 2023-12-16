local M = {}
local ui_plugins = {
	"alpha",
	"bufferline",
	"colorizer",
	"eyeliner",
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
	"ufo",
}

for _, v in ipairs(ui_plugins) do
	table.insert(M, require("plugins.ui." .. v))
end

return M
