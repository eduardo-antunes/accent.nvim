-- Defines a traditional ANSI 16 colors terminal colorscheme; the colors are
-- layed in the traditional order going from indexes 1 to 16 (because lua)

local c = require("accent.colors")
local a = require("accent.accent_colors")

-- The bright colors are more muted than the regular ones, I know, but
-- swapping them made the whole thing seem too dim. What's important is that
-- they're different
local term_colors = {
  c.bg         , -- black
  a.red.fg     , -- red
  a.green.fg   , -- green
  a.yellow.fg  , -- yellow
  a.blue.fg    , -- blue
  a.magenta.fg , -- magent
  a.cyan.fg    , -- cyan
  c.fg         , -- white
  c.bg_gray1   , -- bright black
  a.red.bg     , -- bright red
  a.green.bg   , -- bright green
  a.yellow.bg  , -- bright yellow
  a.blue.bg    , -- bright blue
  a.magenta.bg , -- bright magent
  a.cyan.bg    , -- bright cyan
  c.fg_gray2   , -- bright white
}

return term_colors
