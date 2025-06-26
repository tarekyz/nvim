local opt = vim.opt

-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.mouse = 'a'

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Editing
opt.breakindent = true
opt.undofile = true
opt.clipboard = 'unnamedplus'

-- Completion
opt.completeopt = 'menuone,noselect'

-- Timing
opt.updatetime = 250
opt.timeoutlen = 300

