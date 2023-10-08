local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
-- local configs = require "lspconfig/configs"

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

-- utf-16 offsetEncoding is a hack to deal with "multiple different client offset_encodings detected"
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
capabilities.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup {
  cmd = { "clangd-16" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp", "cuda", "proto" },
  lspconfig.util.root_pattern(
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git"
  ),
  single_file_support = true,
}

-- require("clangd_extensions").setup {
--   server = {
--     -- options to pass to nvim-lspconfig
--     -- i.e. the arguments to require("lspconfig").clangd.setup({})
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { "clangd-16" },
--     filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp", "cuda", "proto" },
--     single_file_support = true,
--     root_dir = lspconfig.util.root_pattern(
--       ".clangd",
--       ".clang-tidy",
--       ".clang-format",
--       "compile_commands.json",
--       "compile_flags.txt",
--       "configure.ac",
--       ".git"
--     ),
--   },
-- }
