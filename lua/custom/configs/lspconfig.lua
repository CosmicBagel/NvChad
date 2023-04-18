local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- lspconfig.omnisharp.setup({
--
-- })

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.csharp_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'csharp-ls' },
    root_dir = lspconfig.util.root_pattern('*.sln', '*.csproj', '*.fsproj', '.git'),
    filetypes = { 'cs' },
    init_options = {
      AutomaticWorkspaceInit = true,
    },
})
--[[
https://github.com/razzmatazz/csharp-language-server
Language Server for C#.
csharp-ls requires the [dotnet-sdk](https://dotnet.microsoft.com/download) to be installed.
The preferred way to install csharp-ls is with `dotnet tool install --global csharp-ls`
--]]
