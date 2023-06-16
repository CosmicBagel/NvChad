local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local configs = require 'lspconfig/configs'

-- lspconfig.omnisharp.setup({
--
-- })

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})

--[[
https://github.com/razzmatazz/csharp-language-server
Language Server for C#.
csharp-ls requires the [dotnet-sdk](https://dotnet.microsoft.com/download) to be installed.
The preferred way to install csharp-ls is with `dotnet tool install --global csharp-ls`
--]]
-- lspconfig.csharp_ls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { 'csharp-ls' },
--     root_dir = lspconfig.util.root_pattern('*.sln', '*.csproj', '*.fsproj', '.git'),
--     filetypes = { 'cs' },
--     init_options = {
--       AutomaticWorkspaceInit = true,
--     },
--     useModernNet = false,
-- })

local omnisharp_bin = "/Users/sam/omnisharp/OmniSharp.exe"
lspconfig.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'mono', omnisharp_bin },
    -- useModernNet = false,
    root_dir = lspconfig.util.root_pattern('*.sln', '*.csproj', '*.fsproj', '.git'),
    filetypes = { 'cs' },
    -- init_options = {
    --   AutomaticWorkspaceInit = true,
    -- },
})

lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
    filetypes = { 'go', 'go.mod' },
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        gopls = {
            gofumpt = true,
            experimentalPostfixCompletions = true,
            staticcheck = true,
            usePlaceholders = true,
        },
    },
}

if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = {
                        "golangci-lint", "run", "--enable-all", "--disable",
                        "lll", "--out-format", "json", "--issues-exit-code=1"
                    };
			}
		};
	}
end

lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}
