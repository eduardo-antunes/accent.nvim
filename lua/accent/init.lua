--[[
Copyright 2025 Eduardo Antunes dos Santos Vieira

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]--

local function option(name)
  local key = string.format("accent_%s", name)
  if vim.g[key] == 0 then return false end
  return vim.g[key]
end


local function get_config()
  local config = {
    no_bg           = option "no_bg"           ,
    darken          = option "darken"          ,
    deuteranopia    = option "deuteranopia"    ,
    terminal        = option "terminal"        ,
    italic_comments = option "italic_comments" ,

    accent = option "color" or option "colour",
    gray_status = option "gray_status" or option "grey_status",
  }
  return config
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
