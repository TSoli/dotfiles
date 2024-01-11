-- binds for zk
if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
	local maps = {
		-- Open the link under the caret.
		-- { "n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>" },
		-- only goes back one so is a bit broken
		{ "n", "<bs>", ":edit #<cr>", "Go to previous page" },

		-- Create a new note after asking for its title.
		-- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
		{
			"n",
			"<localleader>nn",
			"<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title 󰙏 ') }<CR>",
		},
		-- Create a new note in the same directory as the current buffer, using the current selection for title.
		{ "v", "<localleader>nnt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>" },
		-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
		{
			"v",
			"<localleader>nnc",
			":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title 󰙏 ') }<CR>",
		},

		-- Open notes linking to the current buffer.
		{ "n", "<localleader>nb", "<Cmd>ZkBacklinks<CR>" },
		-- Alternative for backlinks using pure LSP and showing the source context.
		--{'n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>'},
		-- Open notes linked by the current buffer.
		{ "n", "<localleader>nl", "<Cmd>ZkLinks<CR>" },

		-- Preview a linked note.
		{ "n", "<localleader>np", "<Cmd>lua vim.lsp.buf.hover()<CR>" },
		-- Open the code actions for a visual selection.
		{ "v", "<localleader>na", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>" },
	}

	for _, map in ipairs(maps) do
		local mode, bind, cmd, description = unpack(map)
		vim.api.nvim_buf_set_keymap(0, mode, bind, cmd, { noremap = true, silent = false, desc = description })
	end

	local close_all_notes = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			local buf_name = vim.api.nvim_buf_get_name(buf)
			local is_zk_buf = require("zk.util").notebook_root(buf_name) ~= nil
			local is_modified = vim.api.nvim_buf_get_option(buf, "modified")
			if vim.api.nvim_buf_is_loaded(buf) and is_zk_buf and not is_modified then
				vim.api.nvim_buf_delete(buf, { force = false })
			end
		end
	end

	vim.api.nvim_buf_set_keymap(0, "n", "<localleader>nq", "", {
		noremap = true,
		silent = false,
		desc = "Close all notes",
		callback = close_all_notes,
	})
end

-- bind Markdown preview
vim.api.nvim_buf_set_keymap(0, "n", "<localleader>mp", "<Cmd>MarkdownPreview<CR>", {
	noremap = true,
	silent = false,
	desc = "open Markdown Preview",
})
