local null_ls = require "null-ls"
local cspell = require('cspell')

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  -- formatting.prettier,
  formatting.stylua,
  formatting.csharpier,
  cspell.diagnostics,
  cspell.code_actions,
  -- lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
