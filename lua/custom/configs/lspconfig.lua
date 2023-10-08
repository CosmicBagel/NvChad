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
--     -- cmd = { "clangd" },
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
--   extensions = {
--     -- defaults:
--     -- Automatically set inlay hints (type hints)
--     autoSetHints = vim.fn.has "nvim-0.10" ~= 1,
--     -- These apply to the default ClangdSetInlayHints command
--     inlay_hints = {
--       inline = vim.fn.has "nvim-0.10" == 1,
--       -- Options other than `highlight' and `priority' only work
--       -- if `inline' is disabled
--       -- Only show inlay hints for the current line
--       only_current_line = false,
--       -- Event which triggers a refersh of the inlay hints.
--       -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
--       -- not that this may cause  higher CPU usage.
--       -- This option is only respected when only_current_line and
--       -- autoSetHints both are true.
--       only_current_line_autocmd = { "CursorHold" },
--       -- whether to show parameter hints with the inlay hints or not
--       show_parameter_hints = true,
--       -- prefix for parameter hints
--       parameter_hints_prefix = "<- ",
--       -- prefix for all the other hints (type, chaining)
--       other_hints_prefix = "=> ",
--       -- whether to align to the length of the longest line in the file
--       max_len_align = false,
--       -- padding from the left if max_len_align is true
--       max_len_align_padding = 1,
--       -- whether to align to the extreme right or not
--       right_align = false,
--       -- padding from the right if right_align is true
--       right_align_padding = 7,
--       -- The color of the hints
--       highlight = "Comment",
--       -- The highlight group priority for extmark
--       priority = 100,
--     },
--     ast = {
--       --[[ These require codicons (https://github.com/microsoft/vscode-codicons) ]]
--       role_icons = {
--         type = "",
--         declaration = "",
--         expression = "",
--         specifier = "",
--         statement = "",
--         ["template argument"] = "",
--       },
--
--       kind_icons = {
--         Compound = "",
--         Recovery = "",
--         TranslationUnit = "",
--         PackExpansion = "",
--         TemplateTypeParm = "",
--         TemplateTemplateParm = "",
--         TemplateParamObject = "",
--       },
--
--       highlights = {
--         detail = "Comment",
--       },
--     },
--     memory_usage = {
--       border = "none",
--     },
--     symbol_info = {
--       border = "none",
--     },
--   },
-- }
