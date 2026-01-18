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

local M = {}

M.accent_list = {
  "red"    ,
  "orange" ,
  "green"  ,
  "yellow" ,
  "blue"   ,
  "magenta",
  "cyan"   ,
}

M.accent_colors = {
  red     = { fg = "#eeaab0", bg = "#e26a74" },
  orange  = { fg = "#f5c1a3", bg = "#ed935e" },
  green   = { fg = "#c8e4b4", bg = "#91c969" },
  yellow  = { fg = "#ffffcc", bg = "#ffff80" },
  blue    = { fg = "#a6d4f2", bg = "#4da8e6" },
  magenta = { fg = "#d4a5d9", bg = "#ba6fc3" },
  cyan    = { fg = "#8fcdd6", bg = "#57b3c1" },
}

function M.get(config)
  config = config or {}
  local darken = config.darken
  local accent = M.accent_colors[config.accent] or M.accent_colors.yellow

  return {
    none       = "NONE",
    accent_fg  = accent.fg,
    accent_bg  = accent.bg,
    fg         = darken and "#dfdfef" or "#efefff",
    fg_gray1   = darken and "#acafb4" or "#bcbfc4",
    fg_gray2   = darken and "#888888" or "#999999",
    fg_inv     = "#282c34",
    fg_invd    = "#181c24",
    bg         = darken and "#181c24" or "#282c34",
    bg_gray1   = "#383c44",
    bg_gray2   = "#484c54",
    bg_inv     = "#cccfd4",

    fg_red     = M.accent_colors.red.fg     ,
    fg_orange  = M.accent_colors.orange.fg  ,
    fg_green   = M.accent_colors.green.fg   ,
    fg_yellow  = M.accent_colors.yellow.fg  ,
    fg_blue    = M.accent_colors.blue.fg    ,
    fg_magenta = M.accent_colors.magenta.fg ,
    fg_cyan    = M.accent_colors.cyan.fg    ,
    bg_red     = M.accent_colors.red.bg     ,
    bg_orange  = M.accent_colors.orange.bg  ,
    bg_green   = M.accent_colors.green.bg   ,
    bg_yellow  = M.accent_colors.yellow.bg  ,
    bg_blue    = M.accent_colors.blue.bg    ,
    bg_magenta = M.accent_colors.magenta.bg ,
    bg_cyan    = M.accent_colors.cyan.bg    ,
  }
end

return M
