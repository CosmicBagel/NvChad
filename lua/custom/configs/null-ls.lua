local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

local cspell_config = {
  config_file_preferred_name = "cspell.json",
}

local sources = {
  -- formatting.prettier,
  formatting.stylua,
  formatting.csharpier,
  null_ls.builtins.code_actions.cspell.with { config = cspell_config },
  null_ls.builtins.diagnostics.cspell.with {
    -- Force the severity to be HINT
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severity = vim.diagnostic.severity.HINT
    end,
    config = cspell_config,
  },
  null_ls.builtins.code_actions.gitsigns,

  -- go formatting --
  null_ls.builtins.formatting.goimports,

  -- go linting --
  null_ls.builtins.diagnostics.golangci_lint,

  -- cpp formatting --
  null_ls.builtins.formatting.clang_format,

  -- cpp linting --
  null_ls.builtins.diagnostics.cpplint,
}

null_ls.setup {
  debug = false,
  sources = sources,
}
