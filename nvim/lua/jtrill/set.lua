vim.opt.guicursor = ""


vim.opt.relativenumber = true
vim.opt.nu  = true
vim.opt.hidden = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop =4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.wrap =false 
vim.opt.errorbells = false
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.scrolloff=8
vim.opt.swapfile=false
vim.opt.signcolumn = "yes"
vim.opt.backup = false
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.title = true
vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight SignColumn guibg=#193549
autocmd ColorScheme * highlight GitSignsAdd guibg=#193549 guifg=#3ad900
autocmd ColorScheme * highlight GitSignsChange guibg=#193549 guifg=#ffc600
autocmd ColorScheme * highlight GitSignsDelete guibg=#193549 guifg=#ff2600
autocmd ColorScheme * highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE
augroup end
]])
