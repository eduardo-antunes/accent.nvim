local M = {}

-- Computes the 32 bit FNV1A hash of the given string
function M.fnv1a(str)
  local bit = require("bit")
  local hash = 2166136261
  for i = 1, #str do
    local c = str:byte(i)
    hash = bit.bxor(hash, c) * 16777619
  end
  return hash
end

-- Sets up main theme, given as a table that maps highlights to colors
function M.load_theme(theme)
  for group, colors in pairs(theme) do
    vim.api.nvim_set_hl(0, group, colors)
  end
end

-- Sets up terminal theme, given as a list of 16 colors
function M.load_term_colors(colors)
  for i = 1, #colors do
    local key = string.format("terminal_color_%d", i - 1)
    vim.g[key] = colors[i]
  end
end

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "accent-nvim"

  local theme = require("accent.theme")
  M.load_theme(theme)

  local conf = require("accent.config")
  if conf.term_colors then
    local colors = require("accent.term_colors")
    M.load_term_colors(colors)
  end
end

return M
