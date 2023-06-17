vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = "120"

vim.opt.shell= "pwsh.exe -NoLogo"
vim.opt.shellxquote = ""
vim.opt.shellcmdflag = "-Command"
vim.opt.shellquote   = ""
vim.opt.shellpipe    = "| Out-File -Encoding UTF8 %s"
vim.opt.shellredir   = "| Out-File -Encoding UTF8 %s"

vim.wo.relativenumber = true

vim.opt.mousescroll="ver:1,hor:3"

vim.api.nvim_create_user_command('LL', 'Lazy load all', {})

