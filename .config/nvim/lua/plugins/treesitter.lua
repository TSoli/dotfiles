-- Treesitter
local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	dependencies = {
		-- {
		-- 	"windwp/nvim-autopairs", -- auto close brackets/quotes
		-- 	event = "VeryLazy",
		-- },
		{
			"windwp/nvim-ts-autotag", -- autoclose/rename tags
			event = "VeryLazy",
		},
		{
			"RRethy/nvim-treesitter-endwise", -- smart end in languages like lua
			event = "VeryLazy",
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring", -- smart commenting
			event = "VeryLazy",
		},
		{
			"nvim-tree/nvim-web-devicons", -- nice icons for nvim-tree
			event = "VeryLazy",
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			event = "VeryLazy",
		},
	},
}

function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")
	-- vim.opt.foldmethod = "expr"
	-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

	configs.setup({
		-- put the language you want in this array
		ensure_installed = {
			"c",
			"cpp",
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"javascript",
			"typescript",
			"tsx",
		},
		-- ensure_installed = "all", -- one of "all" or a list of languages
		-- ignore_install = { "latex" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
				node_incremental = "<leader>si",
				scope_incremental = "<leader>sc",
				node_decremental = "<leader>sd",
			},
		},

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "latex" },
			-- disable = { "css" }, -- list of language that will be disabled
		},
		indent = {
			enable = true,
			-- disable = { "python", "css" },
		},

		autopairs = { enable = true },
		autotag = { enable = true },

		ts_context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},

		endwise = { enable = true },

		textobjects = {
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					-- You can optionally set descriptions to the mappings (used in the desc parameter of
					-- nvim_buf_set_keymap) which plugins like which-key display
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					-- You can also use captures from other query groups like `locals.scm`
					["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
				},
				-- You can choose the select mode (default is charwise 'v')
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * method: eg 'v' or 'o'
				-- and should return the mode ('v', 'V', or '<c-v>') or a table
				-- mapping query_strings to modes.
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "v", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				-- If you set this to `true` (default is `false`) then any textobject is
				-- extended to include preceding or succeeding whitespace. Succeeding
				-- whitespace has priority in order to act similarly to eg the built-in
				-- `ap`.
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * selection_mode: eg 'v'
				-- and should return true of false
				include_surrounding_whitespace = true,
			},
		},
	})
end

return M
