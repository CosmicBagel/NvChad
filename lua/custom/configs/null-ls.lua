local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting

local cspell_config = {
  config_file_preferred_name = "cspell.json",
}

-- local clang_format_style = "--style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100}"

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
  null_ls.builtins.formatting.clang_format.with {
    command = "clang-format",
    args = require("null-ls.helpers").range_formatting_args_factory({
      -- clang_format_style,
      -- "--sort-includes",
      "--assume-filename",
      "$FILENAME",
    }, "--offset", "--length", { use_length = true, row_offset = -1, col_offset = -1 }),
  },

  -- cpp linting --
  -- null_ls.builtins.diagnostics.cpplint.with {
  --   args = {
  --     "--filter=-legal/copyright",
  --     "--linelength=100",
  --     "$FILENAME",
  --   },
  -- },

  -- null_ls.builtins.diagnostics.clang_check.with { command = "clang-check-16" },

  null_ls.builtins.diagnostics.cppcheck.with {
    args = {
      "--enable=warning,style,performance",
      "--template=gcc",
      "--library=cppcheck.cfg",
      "$FILENAME",
    },
  },
}

null_ls.setup {
  debug = false,
  sources = sources,
}
