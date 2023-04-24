local plugins = {
    {   
        "neovim/nvim-lspconfig",
        config = function()
              require "plugins.configs.lspconfig"
              require "custom.configs.lspconfig"
        end,
    },
    {
        "p00f/nvim-ts-rainbow"
    }
}
return plugins
