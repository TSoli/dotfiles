local M = {
  "mbbill/undotree",
  cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
}

function M.config()
  -- focus on toggle
  vim.g.undotree_SetFocusWhenToggle = 1
end

return M
