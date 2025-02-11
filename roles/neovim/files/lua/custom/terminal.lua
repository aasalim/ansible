require("toggleterm").setup {}
vim.keymap.set({'n','v','t'} , '<Leader>t','<Cmd>ToggleTerm<CR>' , { desc = 'Toggle Terminal' })
