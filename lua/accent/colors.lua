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
  red     = { fg = "#e06c75", bg = "#b04c55" },
  orange  = { fg = "#ee9360", bg = "#b66930" },
  green   = { fg = "#98c379", bg = "#689349" },
  yellow  = { fg = "#e5c07b", bg = "#a5803b" },
  blue    = { fg = "#61afe7", bg = "#3876af" },
  magenta = { fg = "#c688cd", bg = "#965498" },
  cyan    = { fg = "#56b6c2", bg = "#3696a2" },
}

function M.get(config)
  config = config or {}
  local darken = config.darken
  local accent = M.accent_colors[config.accent] or M.accent_colors.green

  return {
    none = "NONE",
    accent_fg  = accent.fg,
    accent_bg  = accent.bg,
    fg         = darken and "#dfdfef" or "#efefff",
    fg_gray1   = darken and "#acafb4" or "#bcbfc4",
    fg_gray2   = darken and "#888888" or "#999999",
    fg_gray3   = darken and "#666666" or "#777777",
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
