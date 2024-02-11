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
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.lazygit_use_custom_config_file_path = 1
      vim.g.lazygit_config_file_path = vim.fn.expand "$HOME/.config/lazygit/nvim-config.yml"
    end,
  },
  {
    "NvChad/nvterm",
    init = function()
      require("core.utils").load_mappings "nvterm"
    end,
    config = function()
      require "base46.term"
      require("nvterm").setup {
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.1,
              col = 0.1,
              -- width = 0.5,
              -- height = 0.4,
              width = 0.8,
              height = 0.8,
              -- border = "single",
              border = "rounded",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
          },
        },
        behavior = {
          autoclose_on_quit = {
            enabled = false,
            confirm = true,
          },
          close_on_exit = true,
          auto_insert = true,
        },
      }
    end,
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
  {
    "mbbill/undotree",
    lazy = false,
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}

return plugins
