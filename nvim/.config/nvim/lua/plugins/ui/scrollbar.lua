local M = {
	"petertriho/nvim-scrollbar",
	event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
	local scrollbar = require("scrollbar")

	scrollbar.setup({
		set_highlights = false,
	})
end

return M
