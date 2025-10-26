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
  no_bg = opt("no_bg", false),
  darken = opt("darken", false),
  invert_status = opt("invert_status", false),
  accent = opt("colour", opt("color", "yellow")),
}

return config
