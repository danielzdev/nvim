vim.g.mapleader = " "

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.cmdheight = 0
opt.expandtab = true
opt.fillchars = { eob = " " }
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.jumpoptions = "view"
opt.linebreak = true
opt.mouse = "a"
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.showmode = false
opt.smartcase = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.signcolumn = "yes"
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.winminwidth = 5
opt.wrap = false
