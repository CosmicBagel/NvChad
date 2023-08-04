vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = "120"

local sysname = vim.loop.os_uname().sysname
if sysname == "Windows_NT" then
  -- using powershell on windows
  vim.opt.shell = "pwsh.exe -NoLogo"
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag = "-Command"
  vim.opt.shellquote = ""
  vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
else
  -- using bash on macos and linux
  vim.opt.shell = "bash"
end

if sysname == "Darwin" then
  vim.opt.mousescroll = "ver:1,hor:3"
end

vim.wo.relativenumber = true

function dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

-- og vim messes with my keybindings when opening cpp files, this hacks around that
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>f", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { silent = true, noremap = true })
