-- _____     _       _   _             _             _   _             
--|_   _|_ _| |__   | \ | | __ ___   _(_) __ _  __ _| |_(_) ___  _ __  
--  | |/ _` | '_ \  |  \| |/ _` \ \ / / |/ _` |/ _` | __| |/ _ \| '_ \ 
--  | | (_| | |_) | | |\  | (_| |\ V /| | (_| | (_| | |_| | (_) | | | |
--  |_|\__,_|_.__/  |_| \_|\__,_| \_/ |_|\__, |\__,_|\__|_|\___/|_| |_|
--                                       |___/                         
vim.keymap.set("n", "<C-t>h", ":tabprev<CR>")
vim.keymap.set("n", "<C-t>j", ":tabfirst<CR>")
vim.keymap.set("n", "<C-t>k", ":tablast<CR>")
vim.keymap.set("n", "<C-t>l", ":tabnext<CR>")
vim.keymap.set("n", "<C-t>t", ":tabedit<Space>")
vim.keymap.set("n", "<C-t>n", ":tabnew<CR>")
vim.keymap.set("n", "<C-t>d", ":tabclose<CR>")
