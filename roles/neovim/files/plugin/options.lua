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
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300
vim.opt.mouse = 'a'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Character Tabs
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab=true
vim.opt.smartindent=true

-- Tabs
vim.opt.showtabline=2
vim.opt.laststatus=2
