-- Loads in the user configuration, given through global vim variables

local function opt(name, default)
  local full_name = "accent_" .. name
  if vim.g[full_name] == nil then
    return default
  end
  if vim.g[full_name] == 0 then
    return false
  end
  return vim.g[full_name]
end

local config = {
  no_bg          = opt "no_bg"        ,
  darken         = opt "darken"       ,
  invert_status  = opt "invert_status",
  deuteranopia   = opt "deuteranopia" ,
  term_colors    = opt "term_colors"  ,
  accent         = opt "colour" or opt "color",
  auto_cwd_color = opt "auto_cwd_colour" or opt "auto_cwd_color",
}

if not config.accent and config.auto_cwd_color then
  local colors = { "red", "orange", "green", "yellow", "blue", "magenta", "cyan" }
  local hash = require("accent.utils").fnv1a(vim.fn.getcwd())
  local key = math.modf(math.fmod(math.abs(hash), #colors)) + 1
  config.accent = colors[key]
end

return config
