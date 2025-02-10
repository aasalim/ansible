--  ____                           _ 
-- / ___| ___ _ __   ___ _ __ __ _| |
--| |  _ / _ \ '_ \ / _ \ '__/ _` | |
--| |_| |  __/ | | |  __/ | | (_| | |
-- \____|\___|_| |_|\___|_|  \__,_|_|
--                                   
-- Line Numbers
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.scrolloff=10
vim.opt.sidescrolloff=10

-- Word Wrap
vim.opt.wrap=false
vim.opt.linebreak=true

-- Case Sensitivity
vim.opt.ignorecase=true
vim.opt.smartcase=false

-- Terminal
vim.opt.compatible=false
vim.opt.showcmd=true
vim.opt.cmdheight=1
vim.opt.showmode=true
vim.opt.fileformats='unix'

local has_true_color = vim.fn.has('termguicolors') and vim.fn.has('gui_running')
if has_true_color then
  vim.o.termguicolors = true
end

-- General
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.pumheight=10
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.history=500
vim.opt.ruler=true
vim.opt.hid=true
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.lazyredraw=true
vim.opt.showmatch=true
vim.opt.errorbells=false
vim.opt.visualbell=false
vim.opt.cursorline=true
vim.opt.clipboard="unnamedplus"

--  ____ _                    _              _____     _         
-- / ___| |__   __ _ _ __ ___| |_ ___ _ __  |_   _|_ _| |__  ___ 
--| |   | '_ \ / _` | '__/ __| __/ _ \ '__|   | |/ _` | '_ \/ __|
--| |___| | | | (_| | | | (__| ||  __/ |      | | (_| | |_) \__ \
-- \____|_| |_|\__,_|_|  \___|\__\___|_|      |_|\__,_|_.__/|___/
--                                                               
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab=true
vim.opt.smartindent=true

-- _____     _         
--|_   _|_ _| |__  ___ 
--  | |/ _` | '_ \/ __|
--  | | (_| | |_) \__ \
--  |_|\__,_|_.__/|___/
--                     
vim.opt.showtabline=2
vim.opt.laststatus=2
