local M = {
	"mickael-menu/zk-nvim",
	ft = "markdown",
	cmd = { "ZkNotes", "ZkNew", "ZkCd", "ZkTags", "ZkMatch", "ZkOpenIndex" },
}

function M.config()
	local zk = require("zk")
	local commands = require("zk.commands")
	local util = require("zk.util")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local pickers = require("zk.commands").pickers

	-- Add command to insert markdown-style link to a Zk note
	commands.add("ZkInsertLink", function(options)
		options = options or {}
		pickers
			.get_picker("ZkNotes", {
				options = options,
				picker_options = {
					attach_mappings = function(_, map)
						map("i", "<CR>", function(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							actions.close(prompt_bufnr)

							if not selection or not selection.value then
								return
							end

							local note = selection.value
							local filename = vim.fn.fnamemodify(note.path, ":t") -- get basename
							local name = filename:gsub("%.md$", ""):gsub("^%d+%-", "") -- strip .md and leading ID

							local placeholder = "text"
							local link = string.format("[%s](%s)", placeholder, name)

							-- Insert the link at cursor
							local row, col = unpack(vim.api.nvim_win_get_cursor(0))
							vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { link })

							-- Move cursor inside the brackets and select placeholder
							local start_col = col + 1 -- after '['
							local end_col = start_col + #placeholder

							vim.api.nvim_win_set_cursor(0, { row, start_col })

							vim.cmd("normal! v")
							vim.api.nvim_win_set_cursor(0, { row, end_col })
						end)

						return true
					end,
				},
			})
			:find()
	end)

	commands.add("ZkOrphans", function(options)
		options = vim.tbl_extend("force", { orphan = true }, options or {})
		zk.edit(options, { title = "Zk Orphans" })
	end)

	commands.add("ZkOpenIndex", function(options)
		options = options or {}
		local notebook_path = options.notebook_path or util.resolve_notebook_path(0)
		local root = util.notebook_root(notebook_path)
		if root then
			local index = root .. "/index.md"
			if vim.fn.filereadable(index) ~= 1 then
				index = root .. "/Index.md"
			end

			if vim.fn.filereadable(index) ~= 1 then
				print("Could not open notes index at: " .. index)
				return
			end

			vim.cmd("e " .. index)
		end
	end)

	commands.add("ZkGrep", function(opts)
		-- broken - needs update?
		-- local root = util.resolve_notebook_path(0)
		local root = vim.env.ZK_NOTEBOOK_DIR
		local collection = {}
		local list_opts = { select = { "title", "path", "absPath" } }
		require("zk.api").list(root, list_opts, function(_, notes)
			for _, note in ipairs(notes) do
				collection[note.absPath] = note.title or note.path
			end
		end)

		local options = vim.tbl_deep_extend("force", {
			prompt_title = "Notes",
			search_dirs = { root },
			disable_coordinates = true,
			path_display = function(_, path)
				return collection[path]
			end,
			type_filter = "markdown",
		}, opts or {})
		require("telescope.builtin").live_grep(options)
	end)
	zk.setup({
		-- can be "telescope", "fzf", "fzf_lua" or "select" (`vim.ui.select`)
		-- it's recommended to use "telescope", "fzf" or "fzf_lua"
		picker = "telescope",

		lsp = {
			-- `config` is passed to `vim.lsp.start_client(config)`
			config = {
				cmd = { "zk", "lsp" },
				name = "zk",
				-- on_attach = ...
				-- etc, see `:h vim.lsp.start_client()`
			},

			-- automatically attach buffers in a zk notebook that match the given filetypes
			auto_attach = {
				enabled = true,
				filetypes = { "markdown" },
			},
		},
	})
end

return M
