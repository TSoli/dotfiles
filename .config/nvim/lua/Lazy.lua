-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup lazy_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | Lazy sync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify("Could not find 'lazy' plugin.")
	return
end

-- Install your plugins here
return lazy.setup("plugins", {
	install = { colorscheme = { require("plugins.colorschemes").name } },
	defaults = { lazy = true },
	ui = { wrap = "true" },
	change_detection = { enabled = true },
	debug = false,
	performance = {
		rtp = {
			disabled_plugins = {
				-- "gzip", -- Plugin for editing compressed files.
				-- "matchit", -- What is it?
				--  "matchparen", -- Plugin for showing matching parens
				--  "netrwPlugin", -- Handles file transfers and remote directory listing across a network
				--  "tarPlugin", -- Plugin for browsing tar files
				--  "tohtml", -- Converting a syntax highlighted file to HTML
				--  "tutor", -- Teaching?
				--  "zipPlugin", -- Handles browsing zipfiles
			},
		},
	},
})
