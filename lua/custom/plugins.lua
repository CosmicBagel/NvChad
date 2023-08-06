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
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
          {
            -- "davidmh/cspell.nvim",
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
        lazy = false,
        -- init = require("custom.configs.clangd_extensions").init
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "rust", "c_sharp", "c", "cpp", "zig" },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true,
        max_file_line = nil,
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
    },
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
}

return plugins
