-- Defines the color pallete

local conf = require("accent.config")

local accent_colors = require("accent.accent_colors")
local acc = accent_colors[conf.accent] or accent_colors.default

local colors = {
  none = "NONE",
  accent_fg = acc.fg,
  accent_bg = acc.bg,
  fg        = conf.darken and "#dfdfef" or "#efefff",
  fg_gray1  = conf.darken and "#acafb4" or "#bcbfc4",
  fg_gray2  = conf.darken and "#888888" or "#999999",
  fg_gray3  = conf.darken and "#666666" or "#777777",
  fg_inv    = "#282c34",
  fg_invd   = "#181c24",
  bg        = conf.darken and "#181c24" or "#282c34",
  bg_gray1  = "#383c44",
  bg_gray2  = "#484c54",
  bg_inv    = "#cccfd4",
  fg_red    = accent_colors.red.fg,
  fg_orange = accent_colors.orange.fg,
  fg_green  = accent_colors.green.fg,
  fg_yellow = accent_colors.yellow.fg,
  fg_blue   = accent_colors.blue.fg,
  fg_purple = accent_colors.magenta.fg,
  fg_cyan   = accent_colors.cyan.fg,
}

return colors
