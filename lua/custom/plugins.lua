local plugins = {
    {
        "neovim/nvim-lspconfig",
       dependencies = {
         "jose-elias-alvarez/null-ls.nvim",
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
          return require("plugins.configs.others").vimfugitive
        end,
    },
}
return plugins
