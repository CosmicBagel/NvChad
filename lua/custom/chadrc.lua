---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "chadracula",
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
