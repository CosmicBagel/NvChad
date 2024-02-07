local M = {}

M.general = {
  n = {
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["n"] = { "nzz" },
    ["N"] = { "Nzz" },
    -- no macros plz
    ["q"] = { "<nop>" },
  },
}

M.leap = {
  plugin = true,
  n = {},
}

local symbol_picker_opts = {
  fname_width = 40,
}

M.lspconfig = {
  n = {
    ["gs"] = { "<cmd> ClangdSwitchSourceHeader <CR>", "Clangd - Switch to Header/Implementation File" },
  },
}

M.telescope = {
  n = {
    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references { fname_width = 40, trim_text = true }
      end,
      "LSP - Find references",
    },
    ["<leader>ss"] = {
      function()
        require("telescope.builtin").lsp_document_symbols(symbol_picker_opts)
      end,
      "LSP - Document Symbols",
    },
    ["<leader>sf"] = {
      function()
        require("telescope.builtin").lsp_document_symbols { fname_width = 40, symbols = { "method", "function" } }
      end,
      "LSP - Document Symbols (functions)",
    },
    ["<leader>sw"] = {
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols(symbol_picker_opts)
      end,
      "LSP - Workspace Symbols",
    },
    ["<leader>sc"] = {
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols { fname = 40, symbols = { "class", "enum", "struct" } }
      end,
      "LSP - Workspace Symbols (classes)",
    },
    ["<leader>f'"] = {
      function()
        require("telescope.builtin").marks()
      end,
      "Search bookmarks",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>m"] = {
      function()
        require("trouble").open()
      end,
      "Trouble - Focus Panel",
    },
  },
}

M.ufo = {
  n = {
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds",
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "Close all folds",
    },
    ["zK"] = {
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      "Peek fold",
    },
  },
}

return M
