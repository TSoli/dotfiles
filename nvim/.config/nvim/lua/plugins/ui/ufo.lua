local M = {
	"kevinhwang91/nvim-ufo",
	event = "BufEnter",
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
}

function M.config()
	local ufo = require("ufo")

	ufo.setup({
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	})
end

return M
