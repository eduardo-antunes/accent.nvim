local function option(name)
  local key = string.format("accent_%s", name)
  if vim.g[key] == 0 then return false end
  return vim.g[key]
end


local function cwd_color()
  local function hash(str)
    local bit = require("bit")
    local hash = 2166136261
    for i = 1, #str do
      local c = str:byte(i)
      hash = bit.bxor(hash, c) * 16777619
    end
    return hash
  end

  local function remainder(x, y)
    return math.modf(math.fmod(math.abs(x), y))
  end

  local colors = require("accent.colors").accent_list
  local key = remainder(hash(vim.fn.getcwd()), #colors) + 1
  return colors[key]
end

--------------------------------------------------------------------------------

local function get_config()
  local config = {
    no_bg          = option "no_bg"         ,
    darken         = option "darken"        ,
    invert_status  = option "invert_status" ,
    deuteranopia   = option "deuteranopia"  ,
    terminal       = option "terminal"      ,

    accent = option "color" or option "colour",
    auto_cwd_color = option "auto_cwd_color" or option "auto_cwd_colour",
  }
  if not config.accent and config.auto_cwd_color then
    config.accent = cwd_color()
  end
  return config
end

-- Loads main theme
local function load_theme(theme)
end

-- Loads terminal theme
local function load_terminal_theme(theme)
end

--------------------------------------------------------------------------------

local M = {}

M.accent_colors = require("accent.colors").accent_list

function M.load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "accent-nvim"

  local conf = get_config()
  local theme = require("accent.theme")
  M.colors = require("accent.colors").get(conf)

  local base = theme.get_base(M.colors, conf)
  for group, colors in pairs(base) do
    vim.api.nvim_set_hl(0, group, colors)
  end

  if not conf.terminal then return end
  local term = theme.get_terminal(M.colors)
  for i = 1, #term do
    local key = string.format("terminal_color_%d", i - 1)
    vim.g[key] = term[i]
  end
end

return M
