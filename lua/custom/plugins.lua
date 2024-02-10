local utils = require "core.utils"
local cmp = require "cmp"

local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        --not all terminals send ctrl-space, many send ctrl-@ instead
        ["<C-@>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping.complete(),
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    -- init = function()
    --   require("core.utils").lazy_load "nvim-lspconfig"
    -- end,
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
          {
            "davidmh/cspell.nvim",
            -- lazy = false,
          },
        },
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "Hoffs/omnisharp-extended-lsp.nvim",
      },
      {
        "p00f/clangd_extensions.nvim",
        -- lazy = false,
        -- init = function()
        --   require("custom.configs.clangd_extensions").init()
        -- end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- bagel addition, idk why but if ts loads before lspconfig, lsps don't actually kick off
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = function()
      require "plugins.configs.treesitter"
      require "custom.configs.treesitter"
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = false,
    config = require("custom.configs.others").rainbow,
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = require("custom.configs.others").autosave,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = require("custom.configs.others").vim_fugitive,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    opts = { offset = -2 },
    init = function()
      require("leap").add_default_mappings()
      utils.load_mappings "leap"
    end,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "NMAC427/guess-indent.nvim",
    lazy = false,
    init = function()
      require("guess-indent").setup {}
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/proj", "~/Downloads", "/" },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require "custom.configs.ufo"
    end,
  },
}

return plugins
