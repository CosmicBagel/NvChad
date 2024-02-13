vim.opt.colorcolumn = "100"
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.title = true
vim.opt.titlestring = "%{substitute(getcwd(), $HOME, '~', '')} | %{substitute(expand('%'), $HOME, '~', '')}"

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

vim.api.nvim_create_user_command("ResetTabSize", function()
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
end, {})

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

if vim.g.neovide then
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h10"
  -- vim.g.neovide_scale_factor = 1.0 -- 0.7
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
  -- vim.g.neovide_floating_blur_amount_x = 1.0
  -- vim.g.neovide_floating_blur_amount_y = 1.0
  -- vim.g.neovide_transparency = 0.99
end
