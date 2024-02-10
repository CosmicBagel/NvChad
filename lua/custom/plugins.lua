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
      "HiPhish/nvim-ts-rainbow2",
    },
    opts = function()
      require "plugins.configs.treesitter"
      require "custom.configs.treesitter"
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { "jsx", "cpp" },
          -- Which query to use for finding delimiters
          query = "rainbow-parens",
          -- Highlight the entire buffer all at once
          strategy = require("ts-rainbow").strategy.global,
        },
      }
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = require("custom.configs.others").autosave,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
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
    lazy = false,
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require "custom.configs.ufo"
    end,
  },
  {
    "tamton-aquib/duck.nvim",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch()
      end, { desc = "Unleash the duck" })
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, { desc = "Cook the duck" })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.noice"
    end,
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
}

return plugins
