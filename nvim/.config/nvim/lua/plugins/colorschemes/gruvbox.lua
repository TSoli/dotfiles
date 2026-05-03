local M = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,     -- make sure we load this during startup if it is chosen colorscheme
  priority = 1000,  -- make sure to load this before all the other start plugins
}

-- used for :colorscheme <name>
M.name = "gruvbox"

function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    vim.notify("Could not set '" .. M.name .. "' colorscheme.")
  end
end

return M
