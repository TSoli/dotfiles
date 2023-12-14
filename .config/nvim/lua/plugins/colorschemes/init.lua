local status_ok, M = pcall(require, "plugins.colorschemes.kanagawa-dragon")
if not status_ok then
	vim.notify("failed to load custom colorscheme.")
	return
end

return M
