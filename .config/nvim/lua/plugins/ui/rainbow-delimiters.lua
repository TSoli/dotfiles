local M = {
	"HiPhish/rainbow-delimiters.nvim",
	event = "BufReadPre",
}

function M.config()
	local rainbow_delimiters = require("rainbow-delimiters.setup")

	rainbow_delimiters.setup({
		strategy = {
			[""] = require("rainbow-delimiters.strategy.global"),
			vim = require("rainbow-delimiters.strategy.local"),
		},
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
			html = "rainbow-tags",
			latex = "rainbow-blocks",
			javascript = "rainbow-delimiters-react",
			tsx = "rainbow-delimiters",
		},
		priority = {
			[""] = 110,
			lua = 210,
		},
		highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		},
		blacklist = { "latex" },
	})
end

return M
