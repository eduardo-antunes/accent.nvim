-- Defines the association between highlight groups and colors

local c = require("accent.colors")
local conf = require("accent.config")

local theme = {
  -- Configurable stuff
  Normal = {
    fg = c.fg,
    bg = conf.no_bg and c.none or c.bg
  },
  StatusLine = {
    fg = conf.invert_status and c.fg_invd or c.fg_gray1,
    bg = c.accent_bg
  },
  DiffAdd = {
    fg = conf.deuteranopia and c.fg_blue or c.fg_green,
    bg = c.none
  },

  -- General stuff
  StatusLineNC = { fg = c.fg_gray2 , bg = c.bg_gray2  },
  VertSplit    = { fg = c.accent_fg, bg = c.bg_gray1  },
  LineNr       = { fg = c.fg_gray3 , bg = c.none      },
  CursorLineNr = { fg = c.fg_gray1 , bg = c.none      },
  CursorLine   = { fg = c.none     , bg = c.bg_gray1  },
  MatchParen   = { fg = c.fg_gray1 , bg = c.bg_gray1  },
  NonText      = { fg = c.fg_gray2 , bg = c.none      },
  WildMenu     = { fg = c.fg_inv   , bg = c.bg_inv    },
  Search       = { fg = c.fg_inv   , bg = c.accent_bg },
  Folded       = { fg = c.fg_gray1 , bg = c.bg_gray1  },
  Visual       = { fg = c.none     , bg = c.bg_gray2  },
  Pmenu        = { fg = c.fg_gray2 , bg = c.bg_gray1  },
  PmenuSel     = { fg = c.accent_fg, bg = c.bg_gray2  },
  TabLine      = { fg = c.fg_gray2 , bg = c.bg_gray1  },
  TabLineFill  = { fg = c.fg_gray2 , bg = c.bg_gray2  },
  Question     = { fg = c.accent_fg, bg = c.none      },
  QuickfixLine = { fg = c.accent_fg, bg = c.none      },
  Directory    = { fg = c.fg_gray1 , bg = c.none      },

  -- Code syntax (standard vim system)
  Comment    = { fg = c.fg_gray2 , bg = c.none },
  String     = { fg = c.accent_fg, bg = c.none },
  Number     = { fg = c.accent_fg, bg = c.none },
  Constant   = { fg = c.accent_fg, bg = c.none },
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
  DiffDelete = { fg = c.fg_red  , bg = c.none     },
  DiffChange = { fg = c.none    , bg = c.bg_gray1 },
  DiffText   = { fg = c.fg_gray1, bg = c.none     },
  Added      = { link = "DiffAdd"    },
  Removed    = { link = "DiffDelete" },

  -- Diagnostics
  DiagnosticError = { fg = c.fg_red   , bg = c.none },
  DiagnosticWarn  = { fg = c.fg_yellow, bg = c.none },
  DiagnosticInfo  = { fg = c.fg_blue  , bg = c.none },
  DiagnosticHint  = { fg = c.fg_cyan  , bg = c.none },
  DiagnosticOk    = { fg = c.fg_green , bg = c.none },

  -- Diagnostics underline
  DiagnosticUnderlineError = { fg = c.fg_red   , bg = c.none, undercurl = true },
  DiagnosticUnderlineWarn  = { fg = c.fg_yellow, bg = c.none, undercurl = true },
  DiagnosticUnderlineInfo  = { fg = c.fg_blue  , bg = c.none, undercurl = true },
  DiagnosticUnderlineHint  = { fg = c.fg_cyan  , bg = c.none, undercurl = true },
  DiagnosticUnderlineOk    = { fg = c.fg_green , bg = c.none, undercurl = true },

  -- General links
  NormalFloat = { link = "Normal"     },
  IncSearch   = { link = "Search"     },
  CurSearch   = { link = "Search"     },
  Macro       = { link = "PreProc"    },
  SpecialKey  = { link = "Comment"    },
  Title       = { link = "String"     },
  Function    = { link = "Identifier" },
  Character   = { link = "String"     },
  ErrorMsg    = { link = "Error"      },
  MoreMsg     = { link = "String"     },
  FoldColumn  = { link = "String"     },

  -- Treesitter stuff. By default it ends up coloring too much
  ["@variable.builtin"] = { link = "Identifier" },
  ["@function.builtin"] = { link = "Identifier" },
  ["@module.builtin"]   = { link = "Identifier" },
  ["@tag.builtin"]      = { link = "Identifier" },
  ["@type.builtin"]     = { link = "Identifier" },
  ["@constant.builtin"] = { link = "Constant"   },
  ["@constructor"]      = { link = "Statement"  },
  ["@variable.parameter.builtin"] = { link = "Identifier" },

  -- Little bit of plugin configuration
  MiniPickPrompt       = { link = "String" },
  MiniPickPromptCaret  = { link = "String" },
  MiniPickPromptPrefix = { link = "String" },
  MiniPickMatchRanges  = { link = "String" },
}

return theme
