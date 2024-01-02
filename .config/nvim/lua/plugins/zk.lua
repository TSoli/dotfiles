local M = {
	"mickael-menu/zk-nvim",
	ft = "markdown",
	cmd = { "ZkNotes", "ZkNew", "ZkCd", "ZkTags", "ZkMatch", "ZkOpenIndex" },
}

function M.config()
	local zk = require("zk")
	local commands = require("zk.commands")
	local util = require("zk.util")

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
