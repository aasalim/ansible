local set = vim.keymap.set
local k = vim.keycode

set("n", "<leader><leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader>r", "<cmd>source %<CR>", { desc = "Execute the current file" })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")
