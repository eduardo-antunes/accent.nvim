-- Defines the range of available accent colors. The user picks one to be
-- the primary accent color used; the others are used sparingly, in situations
-- where color coding is significant

local accent_colors = {
  red     = { fg = "#e06c75", bg = "#b04c55" },
  orange  = { fg = "#ee9360", bg = "#b66930" },
  green   = { fg = "#98c379", bg = "#689349" },
  yellow  = { fg = "#e5c07b", bg = "#a5803b" },
  blue    = { fg = "#61afe7", bg = "#3876af" },
  magenta = { fg = "#c688cd", bg = "#965498" },
  cyan    = { fg = "#56b6c2", bg = "#3696a2" },
}
-- The default in the original accent.vim is yellow; I like green better, so
-- it's the default here. The perks of being a benevolent dictator
accent_colors.default = accent_colors.green

return accent_colors
