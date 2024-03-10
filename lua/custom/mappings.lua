local M = {}

M.general = {
  n = {
    -- keep things centered with zz
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["n"] = { "nzz" },
    ["N"] = { "Nzz" },
    -- no macros plz
    ["q"] = { "<nop>" },
    -- resize windows more easily
    ["<C-Up>"] = { ":resize +3<cr>" },
    ["<C-Down>"] = { ":resize -3<cr>" },
    ["<C-Left>"] = { ":vertical resize -3<cr>" },
    ["<C-Right>"] = { ":vertical resize +3<cr>" },
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
    ["<leader>fp"] = {
      function()
        require("telescope").extensions.notify.notify()
      end,
      "Search notification (notify)",
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

M.undotree = {
  n = {
    ["<leader>u"] = {
      function()
        vim.cmd.UndotreeToggle()
      end,
      "Toggle Undotree",
    },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = {
      function()
        vim.cmd.LazyGit()
      end,
      "Toggle LazyGit window",
    },
  },
}

M.dap = {
  n = {
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "DAP - Debug Continue",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "DAP - Debug Step Over",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "DAP - Debug Step Into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "DAP - Debug Step Out",
    },
    ["<leader>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "DAP - Debug Toggle Breakpoint",
    },
    ["<leader>B"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")()
      end,
      "DAP - Debug Set Breakpoint",
    },
    ["<leader>lp"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")()
      end,
      "DAP - Debug Set Breakpoint",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
      "DAP - Debug REPL Open",
    },
    ["<leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "DAP - Debug Run Last",
    },
  },
}

return M
