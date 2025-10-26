-- Defines the association between highlight groups and colors

local c = require("accent.colors")
local conf = require("accent.config")

local theme = {
  Normal = {
    fg = c.fg,
    bg = conf.no_bg and c.none or c.bg
  },
  StatusLine = {
    fg = conf.invert_status and c.fg_invd or c.fg_gray1,
    bg = c.accent_bg
  },

  -- General stuff
  StatusLineNC = { fg = c.fg_gray2 , bg = c.bg_b2     },
  VertSplit    = { fg = c.accent_fg, bg = c.bg_b1     },
  LineNr       = { fg = c.fg_gray3 , bg = c.none      },
  CursorLineNr = { fg = c.fg_gray1 , bg = c.none      },
  CursorLine   = { fg = c.none     , bg = c.bg_b1     },
  MatchParen   = { fg = c.fg_gray1 , bg = c.bg_b1     },
  NonText      = { fg = c.fg_gray2 , bg = c.none      },
  WildMenu     = { fg = c.fg_inv   , bg = c.bg_inv    },
  Search       = { fg = c.fg_inv   , bg = c.accent_bg },
  Folded       = { fg = c.fg_gray1 , bg = c.bg_b1     },
  Visual       = { fg = c.none     , bg = c.bg_b2     },
  Pmenu        = { fg = c.fg_gray2 , bg = c.bg_b1     },
  PmenuSel     = { fg = c.accent_fg, bg = c.bg_b2     },
  TabLine      = { fg = c.fg_gray2 , bg = c.bg_b1     },
  TabLineFill  = { fg = c.fg_gray2 , bg = c.bg_b2     },
  Question     = { fg = c.accent_fg, bg = c.none      },
  QuickfixLine = { fg = c.accent_fg, bg = c.none      },

  -- Code syntax
  Comment    = { fg = c.fg_gray2 , bg = c.none },
  String     = { fg = c.accent_fg, bg = c.none },
  Number     = { fg = c.fg       , bg = c.none },
  Type       = { fg = c.fg       , bg = c.none },
  Statement  = { fg = c.fg_gray1 , bg = c.none },
  PreProc    = { fg = c.fg_gray2 , bg = c.none },
  Underlined = { fg = c.fg       , bg = c.none  , underline = true },
  Special    = { fg = c.accent_fg, bg = c.none },
  Error      = { fg = c.fg_red   , bg = c.none },
  Operator   = { fg = c.fg_gray1 , bg = c.none },
  Identifier = { fg = c.fg       , bg = c.none },
  Todo       = { fg = c.fg       , bg = c.none },

  -- Diff mode
  DiffAdd    = { fg = c.fg_green, bg = c.none  },
  DiffDelete = { fg = c.fg_red  , bg = c.none  },
  DiffChange = { fg = c.none    , bg = c.bg_b1 },
  DiffText   = { fg = c.fg_gray1, bg = c.none  },

  -- Diagnostics
  DiagnosticError   = { fg = c.fg_red   , bg = c.none },
  DiagnosticWarning = { fg = c.fg_yellow, bg = c.none },
  DiagnosticInfo    = { fg = c.fg_blue  , bg = c.none },
  DiagnosticHint    = { fg = c.fg_cyan  , bg = c.none },
  DiagnosticOk      = { fg = c.fg_green , bg = c.none },

  -- Links
  NormalFloat = { link = "Normal"   },
  IncSearch   = { link = "Search"   },
  CurSearch   = { link = "Search"   },
  Macro       = { link = "PreProc"  },
  Constant    = { link = "Type"     },
  SpecialKey  = { link = "Comment"  },
  Title       = { link = "Type"     },
  Directory   = { link = "Type"     },
  Function    = { link = "Type"     },
  Character   = { link = "String"   },
  ErrorMsg    = { link = "Error"    },
  MoreMsg     = { link = "Question" },
  FoldColumn  = { link = "Question" },
}

return theme
