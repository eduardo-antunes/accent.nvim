-- Defines the color pallete

local conf = require("accent.config")

local accent_colors = {
  red     = { fg = "#e06c75", bg = "#b04c55" },
  orange  = { fg = "#ee9360", bg = "#b66930" },
  green   = { fg = "#98c379", bg = "#689349" },
  yellow  = { fg = "#e5c07b", bg = "#a5803b" },
  blue    = { fg = "#61afe7", bg = "#3876af" },
  magenta = { fg = "#c688cd", bg = "#965498" },
  cyan    = { fg = "#56b6c2", bg = "#3696a2" },
}
local acc = accent_colors[conf.accent] or accent_colors.yellow

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
  bg_b1     = "#383c44",
  bg_b2     = "#484c54",
  bg_inv    = "#cccfd4",

  fg_red    = accent_colors.red.fg,
  fg_orange = accent_colors.orange.fg,
  fg_green  = accent_colors.green.fg,
  fg_yellow = accent_colors.yellow.fg,
  fg_blue = accent_colors.blue.fg,
  fg_purple = accent_colors.magenta.fg,
  fg_cyan = accent_colors.cyan.fg,
}

return colors
