local M = {}

M.general = {
  n = {
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["n"] = { "nzz" },
    ["N"] = { "Nzz" },
  },
}

M.symbols_outline = {
  plugin = true,
  n = {
    ["<C-m>"] = { "<cmd> SymbolsOutline <CR>", "Toggle Symbol Outline" },
  },
}

M.leap = {
  plugin = true,
  n = {},
}

return M
