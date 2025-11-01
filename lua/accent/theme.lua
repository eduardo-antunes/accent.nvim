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

function M.get_base(colors, config)
  local c = colors
  config = config or {}

  local background = config.no_bg
    and c.none
    or c.bg
  local status_fg = config.invert_status
    and c.fg_invd
    or c.fg_gray1
  local diff_add = config.deuteranopia
    and c.fg_blue
    or c.fg_green

  return {
    -- General stuff
    Normal       = { fg = c.fg       , bg = background  },
    StatusLine   = { fg = status_fg  , bg = c.accent_bg },
    DiffAdd      = { fg = diff_add   , bg = c.none      },
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

    -- Diagnostics
    DiagnosticError = { fg = c.fg_red   , bg = c.none },
    DiagnosticWarn  = { fg = c.fg_yellow, bg = c.none },
    DiagnosticInfo  = { fg = c.fg_blue  , bg = c.none },
    DiagnosticHint  = { fg = c.fg_cyan  , bg = c.none },
    DiagnosticOk    = { fg = c.fg_green , bg = c.none },

    -- Diagnostics underline
    DiagnosticUnderlineError = { sp = c.fg_red   , bg = c.none, undercurl = true },
    DiagnosticUnderlineWarn  = { sp = c.fg_yellow, bg = c.none, undercurl = true },
    DiagnosticUnderlineInfo  = { sp = c.fg_blue  , bg = c.none, undercurl = true },
    DiagnosticUnderlineHint  = { sp = c.fg_cyan  , bg = c.none, undercurl = true },
    DiagnosticUnderlineOk    = { sp = c.fg_green , bg = c.none, undercurl = true },

    -- Spell stuff
    SpellBad   = { sp = c.fg_red    , bg = c.none, undercurl = true },
    SpellCap   = { sp = c.fg_blue   , bg = c.none, undercurl = true },
    SpellRare  = { sp = c.fg_magenta, bg = c.none, undercurl = true },
    SpellLocal = { sp = c.fg_cyan   , bg = c.none, undercurl = true },

    -- Messages
    OkMsg      = { fg = c.fg_green , bg = c.none },
    WarningMsg = { fg = c.fg_yellow, bg = c.none },
    ErrorMsg   = { fg = c.red      , bg = c.none },
    MoreMsg    = { fg = c.accent_fg, bg = c.none },
    ModeMsg    = { fg = c.accent_fg, bg = c.none },

    -- Debug. I don't know where this is used, but I will set it anyway
    RedrawDebugClear     = { fg = c.fg_none, bg = c.bg_yellow },
    RedrawDebugComposed  = { fg = c.fg_none, bg = c.bg_green  },
    RedrawDebugRecompose = { fg = c.fg_none, bg = c.bg_red    },


    -- General links
    NormalFloat = { link = "Normal"     },
    IncSearch   = { link = "Search"     },
    CurSearch   = { link = "Search"     },
    Macro       = { link = "PreProc"    },
    SpecialKey  = { link = "Comment"    },
    Title       = { link = "String"     },
    Function    = { link = "Identifier" },
    Character   = { link = "String"     },
    FoldColumn  = { link = "String"     },
    Added       = { link = "DiffAdd"    },
    Removed     = { link = "DiffDelete" },
    Changed     = { link = "DiffChange" },

    -- Treesitter stuff. By default it ends up coloring too much
    ["@variable.builtin"] = { link = "Identifier" },
    ["@function.builtin"] = { link = "Identifier" },
    ["@module.builtin"]   = { link = "Identifier" },
    ["@tag.builtin"]      = { link = "Identifier" },
    ["@type.builtin"]     = { link = "Identifier" },
    ["@constant.builtin"] = { link = "Constant"   },
    ["@constructor"]      = { link = "Statement"  },
    ["@variable.parameter.builtin"] = { link = "Identifier" },

    -- mini.pick
    MiniPickPrompt       = { link = "String" },
    MiniPickPromptCaret  = { link = "String" },
    MiniPickPromptPrefix = { link = "String" },
    MiniPickMatchRanges  = { link = "String" },

    -- fugitive
    FugitiveUntrackedModifier = { link = "String" },
    FugitiveUnstagedModifier  = { link = "String" },
    FugitiveStagedModifier    = { link = "String" },
  }
end

function M.get_terminal(colors)
  return {
    colors.bg         , -- black
    colors.fg_red     , -- red
    colors.fg_green   , -- green
    colors.fg_yellow  , -- yellow
    colors.fg_blue    , -- blue
    colors.fg_magenta , -- magent
    colors.fg_cyan    , -- cyan
    colors.fg         , -- white
    colors.bg_gray1   , -- bright black
    colors.bg_red     , -- bright red
    colors.bg_green   , -- bright green
    colors.bg_yellow  , -- bright yellow
    colors.bg_blue    , -- bright blue
    colors.bg_magenta , -- bright magent
    colors.bg_cyan    , -- bright cyan
    colors.fg_gray2   , -- bright white
  }
end

return M
