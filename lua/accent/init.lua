local M = {}

function M.load_colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  -- Dark colorscheme only and truecolors required (for now, at least)
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "accent-nvim"

  local theme = require("accent.theme")
  for group, colors in pairs(theme) do
    vim.api.nvim_set_hl(0, group, colors)
  end
end

return M
