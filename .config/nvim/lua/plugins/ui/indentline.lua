local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufEnter",
	main = "ibl",
}

function M.config()
	local ibl = require("ibl")

	local highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	}

	local bg_highlight = {
		"RainbowDelimiterBGRed",
		"RainbowDelimiterBGYellow",
		"RainbowDelimiterBGBlue",
		"RainbowDelimiterBGOrange",
		"RainbowDelimiterBGGreen",
		"RainbowDelimiterBGViolet",
		"RainbowDelimiterBGCyan",
	}

	ibl.setup({
		enabled = true,
		debounce = 200,
		viewport_buffer = {
			min = 30,
			max = 500,
		},
		indent = {
			-- char = "▎",
			char = "▏",
			tab_char = nil,
			-- highlight = "IblIndent",
			highlight = highlight,
			smart_indent_cap = true,
			priority = 1,
		},
		whitespace = {
			highlight = "IblWhitespace",
			-- highlight = bg_highlight,
			remove_blankline_trail = false,
		},
		scope = {
			enabled = true,
			char = "▎",
			-- char = nil,
			show_start = true,
			show_end = true,
			show_exact_scope = false,
			injected_languages = true,
			-- highlight = "IblScope",
			highlight = highlight,
			priority = 1024,
			include = {
				node_type = {},
			},
			exclude = {
				language = {},
				node_type = {
					["*"] = {
						"source_file",
						"program",
					},
					lua = {
						"chunk",
					},
					python = {
						"module",
					},
				},
			},
		},
		exclude = {
			filetypes = {
				"lspinfo",
				"packer",
				"checkhealth",
				"help",
				"man",
				"NvimTree",
				"gitcommit",
				"TelescopePrompt",
				"TelescopeResults",
				"",
			},
			buftypes = {
				"terminal",
				"nofile",
				"quickfix",
				"prompt",
			},
		},
	})
end

return M
