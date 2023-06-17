local utils = require "core.utils"
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = {
        {
          "davidmh/cspell.nvim",
          lazy = false,
        },
      },
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = false,
    config = function()
      return require("plugins.configs.others").rainbow
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      return require("plugins.configs.others").autosave
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      return require("plugins.configs.others").vim_fugitive
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      utils.load_mappings "symbols_outline"
      return require("custom.configs.others").symbols_outline
    end,
  },
}



return plugins
