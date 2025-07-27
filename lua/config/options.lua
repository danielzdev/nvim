-- Globals
vim.g.zig_fmt_parse_errors = 0 -- This is needed, cause for whatever god forsaken reason neovim opens the qfl when using zig/zls

vim.g.mapleader = ' '

vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.confirm = true
vim.opt.cmdheight = 0
vim.opt.expandtab = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.jumpoptions = 'view'
vim.opt.linebreak = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 15
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.virtualedit = 'block'
vim.opt.winminwidth = 5
vim.opt.wrap = false
