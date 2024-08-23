local opt = vim.opt

local opt = vim.opt

opt.number = true
opt.relativenumber = true

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.wrap = false

opt.scrolloff = 10
opt.sidescrolloff = 5

opt.mouse = "a"
opt.clipboard:append("unnamedplus")

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = "yes"
opt.list = true

opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"

opt.updatetime = 50
opt.timeoutlen = 500

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#folexpr()"

vim.wo.foldlevel = 99
