local M = {
	"rebelot/kanagawa.nvim",
	lazy = false, -- make sure we load this during startup if it is chosen colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
}

-- used for :colorscheme <name>
M.name = "kanagawa"

function M.config()
	local kanagawa = require(M.name)
	local utils = require("plugins.colorschemes.utils")

	-- required to set a theme below
	vim.o.background = nil

	kanagawa.setup({
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		theme = "dragon",
		overrides = function(colors)
			local bg = colors.theme.ui.bg
			local scrollbar_bg = utils.blend_colors(colors.theme.ui.special, bg, 0.4)
			return {
				-- transparent background
				-- Normal = { bg = "none" },
				-- NormalFloat = { bg = "none" },
				-- FoldColumn = { bg = "none" },
				-- Tabline = { bg = "none" },
				-- TablineSel = { bg = "none" },
				-- TablineFill = { bg = "none" },
				-- StatusLine = { bg = "none" },
				-- StatusLineNC = { bg = "none" },
				-- WinBar = { bg = "none" },
				-- WinBarNC = { bg = "none" },
				-- FloatBorder = { bg = "none" },

				-- for line numbers
				LineNr = { bg = "none" },
				CursorLineNr = { fg = colors.palette.dragonOrange, bg = "none" },

				-- ruler colour
				-- ColorColumn = { bg = utils.blend_colors(colors.palette.winterRed, bg, 1) },

				-- For rainbow-delimiters coloring
				RainbowDelimiterRed = { fg = colors.palette.dragonRed },
				RainbowDelimiterYellow = { fg = colors.palette.autumnYellow },
				RainbowDelimiterBlue = { fg = colors.palette.springBlue },
				RainbowDelimiterOrange = { fg = colors.palette.surimiOrange },
				RainbowDelimiterGreen = { fg = colors.palette.springGreen },
				RainbowDelimiterViolet = { fg = colors.palette.oniViolet },
				RainbowDelimiterCyan = { fg = colors.palette.waveAqua1 },

				-- For backgrounds
				RainbowDelimiterBGRed = { bg = utils.blend_colors(colors.palette.dragonRed, bg, 0.2) },
				RainbowDelimiterBGYellow = { bg = utils.blend_colors(colors.palette.autumnYellow, bg, 0.2) },
				RainbowDelimiterBGBlue = { bg = utils.blend_colors(colors.palette.springBlue, bg, 0.2) },
				RainbowDelimiterBGOrange = { bg = utils.blend_colors(colors.palette.surimiOrange, bg, 0.2) },
				RainbowDelimiterBGGreen = { bg = utils.blend_colors(colors.palette.springGreen, bg, 0.2) },
				RainbowDelimiterBGViolet = { bg = utils.blend_colors(colors.palette.oniViolet, bg, 0.2) },
				RainbowDelimiterBGCyan = { bg = utils.blend_colors(colors.palette.waveAqua1, bg, 0.2) },

				-- scrollbar
				ScrollbarHandle = { bg = scrollbar_bg },
				ScrollbarCursor = { fg = scrollbar_bg, bg = nil },
				ScrollbarCursorHandle = { bg = scrollbar_bg, fg = bg },
				ScrollbarSearch = { fg = colors.palette.surimiOrange },
				ScrollbarSearchHandle = { fg = colors.palette.surimiOrange },
				ScrollbarError = { fg = colors.theme.diag.error, bold = true },
				ScrollbarErrorHandle = { fg = colors.theme.diag.error, bg = scrollbar_bg, bold = true },
				ScrollbarWarn = { fg = colors.theme.diag.warning, bold = true },
				ScrollbarWarnHandle = { fg = colors.theme.diag.warning, bg = scrollbar_bg, bold = true },
				ScrollbarInfo = { fg = colors.theme.diag.info, bold = true },
				ScrollbarInfoHandle = { fg = colors.theme.diag.info, bg = scrollbar_bg, bold = true },
				ScrollbarHint = { fg = colors.theme.diag.hint, bold = true },
				ScrollbarHintHandle = { fg = colors.theme.diag.hint, bg = scrollbar_bg, bold = true },
				ScrollbarMisc = { bg = nil },
				ScrollbarMiscHandle = { bg = scrollbar_bg },
				ScrollbarGitAdd = { bg = nil },
				ScrollbarGitAddHandle = { bg = scrollbar_bg },
				ScrollbarGitChange = { bg = nil },
				ScrollbarGitChangeHandle = { bg = scrollbar_bg },
				ScrollbarGitDelete = { bg = nil },
				ScrollbarGitDeleteHandle = { bg = scrollbar_bg },
			}
		end,
	})

	local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
	if not status_ok then
		vim.notify("Could not set '" .. M.name .. "' colorscheme.")
	end

	-- set tranparent backgrounds
	utils.set_transparent_background()
end

return M
