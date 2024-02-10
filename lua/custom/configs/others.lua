local M = {}

M.rainbow = {
  enable = true,
}

M.autosave = {
  enable = true,
  execution_message = {
    -- effectively disables displaying a message, as I found it to get very spammy
    message = "",
  },
}

M.vim_fugitive = {
  enable = true,
}

M.symbols_outline = {}

return M
