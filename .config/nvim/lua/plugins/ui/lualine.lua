local M = {
	"nvim-lualine/lualine.nvim",
	event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
	local lualine = require("lualine")

	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn" },
		symbols = { error = " ", warn = " " },
		colored = false,
		always_visible = true,
	}

	local diff = {
		"diff",
		colored = false,
		symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
		cond = hide_in_width,
	}

	local filetype = {
		"filetype",
		icons_enabled = false,
	}

	local location = {
		"location",
		padding = 0,
	}

	local spaces = function()
		return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
	end

	local custom_theme = require("lualine.themes.auto")
	custom_theme.normal.c.bg = "none"

	lualine.setup({
		options = {
			globalstatus = true,
			icons_enabled = true,
			-- theme = "auto",
			theme = custom_theme,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { diagnostics },
			lualine_x = { diff, spaces, "encoding", filetype },
			lualine_y = { location },
			lualine_z = { "progress" },
		},
		extensions = { "fugitive" },
	})
end

return M
