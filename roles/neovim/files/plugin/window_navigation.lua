--__        ___           _               
--\ \      / (_)_ __   __| | _____      __
-- \ \ /\ / /| | '_ \ / _` |/ _ \ \ /\ / /
--  \ V  V / | | | | | (_| | (_) \ V  V / 
--   \_/\_/  |_|_| |_|\__,_|\___/ \_/\_/  
--                                        
-- _   _             _             _   _             
--| \ | | __ ___   _(_) __ _  __ _| |_(_) ___  _ __  
--|  \| |/ _` \ \ / / |/ _` |/ _` | __| |/ _ \| '_ \ 
--| |\  | (_| |\ V /| | (_| | (_| | |_| | (_) | | | |
--|_| \_|\__,_| \_/ |_|\__, |\__,_|\__|_|\___/|_| |_|
--                     |___/                         
vim.keymap.set("n", "<C-w>%",  ":vsplit<CR>")
vim.keymap.set("n", '<C-w>"',  ":split<CR>")
vim.keymap.set("n", "<C-w>d"    ,"<C-w>c")

vim.keymap.set("n", "<C-Left>" ,  ":vertical resize +3<CR>")
vim.keymap.set("n", "<C-Right>",  ":vertical resize -3<CR>")
vim.keymap.set("n", "<C-Up>"   ,  ":horizontal resize +3<CR>")
vim.keymap.set("n", "<C-Down>" ,  ":horizontal resize -3<CR>")
