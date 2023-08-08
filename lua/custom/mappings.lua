local M = {}

M.general = {
  n = {
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["n"] = { "nzz" },
    ["N"] = { "Nzz" },
  },
}

M.leap = {
  plugin = true,
  n = {},
}

local symbol_picker_opts = {
  fname_width = 40,
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
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = {
      function()
        require("trouble").toggle()
      end,
      "Trouble - Open Panel",
    },
    ["<leader>tf"] = {
      function()
        require("trouble").open()
      end,
      "Trouble - Focus Panel",
    },
    ["<leader>tr"] = {
      function()
        require("trouble").refresh()
      end,
      "Trouble - Refresh",
    },
    ["<leader>th"] = {
      function()
        require("trouble").help()
      end,
      "Trouble - Help",
    },
  },
}

return M
