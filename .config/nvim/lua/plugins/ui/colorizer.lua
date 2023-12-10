local M = {
	"norcalli/nvim-colorizer.lua",
	event = "VeryLazy",
}

function M.config()
	local colorizer = require("colorizer")

	colorizer.setup()
end

return M
