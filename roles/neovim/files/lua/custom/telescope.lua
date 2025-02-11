
require('telescope').setup {
    defaults = {
        initial_mode="insert",
    },
             pickers={
                 find_files ={
                     initial_mode = "insert"
                 }
             }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope grep string(word)' })
