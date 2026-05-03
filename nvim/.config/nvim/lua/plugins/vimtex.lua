local M = {
	"lervag/vimtex",
	-- lazy = false
	ft = { "tex", "sty", "bib" },
}

function M.config()
	vim.g["vimtex_syntax_enabled"] = 1
	vim.g["vimtex_view_method"] = "zathura"
	-- vim.g["vimtex_mappings_prefix"] = "<leader>k"
	vim.g["vimtex_compiler_progname"] = "nvr"
end

return M
