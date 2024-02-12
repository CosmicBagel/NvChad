---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "ayu_dark",
  hl_override = {
    CursorLine = {
      bg = "#000000",
      fg = "NONE",
      sp = "NONE",
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

-- lazyload it when there are 1+ buffers
M.ui.tabufline = {
  show_numbers = false,
  enabled = false,
  lazyload = true,
  overriden_modules = nil,
}

M.ui.cheatsheet = {
   theme = "simple", -- simple/grid
}

M.ui.nvdash = {
  load_on_startup = true,

  header = {
    "         CosmicBagel nvim        ",
  },

  buttons = {
    { "  Find File", "Spc f f", "Telescope find_files" },
    { "  Recent Files", "Spc f o", "Telescope oldfiles" },
    { "  Find Word", "Spc f w", "Telescope live_grep" },
    { "  Bookmarks", "Spc b m", "Telescope marks" },
    { "  Themes", "Spc t h", "Telescope themes" },
    { "  Mappings", "Spc c h", "NvCheatsheet" },
  },
}

return M
