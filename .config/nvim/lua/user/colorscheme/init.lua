local status_ok, _ = pcall(require, "user.colorscheme.kanagawa-dragon")
if not status_ok then
  vim.notify("failed to load 'kanagawa' colorscheme")
end
