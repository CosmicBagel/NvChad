local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
}

local omnisharp_bin = ""
local omnisharp_cmd = {}

if vim.loop.os_uname().sysname == "Windows_NT" then
  omnisharp_bin = "C:\\Users\\samue\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp-mono\\OmniSharp.exe"
  omnisharp_cmd = { omnisharp_bin }
else
  omnisharp_bin = "/Users/sam/omnisharp/OmniSharp.exe"
  omnisharp_cmd = { "mono", omnisharp_bin }
end

lspconfig.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = omnisharp_cmd,
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", "*.fsproj", ".git"),
  filetypes = { "cs" },
  enable_import_completion = true,

  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
  filetypes = { "go", "go.mod" },
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
      cmd = { "golangci-lint-langserver" },
      root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
      init_options = {
        command = {
          "golangci-lint",
          "run",
          "--enable-all",
          "--disable",
          "lll",
          "--out-format",
          "json",
          "--issues-exit-code=1",
        },
      },
    },
  }
end

lspconfig.golangci_lint_ls.setup {
  filetypes = { "go", "gomod" },
}
