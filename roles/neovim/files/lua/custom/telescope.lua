require('telescope').setup {
  defaults = {
    initial_mode = 'insert',
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.99,
      height = 0.99,
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
  },
  pickers = {
    find_files = {
      initial_mode = 'insert',
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set(
  'n',
  '<leader>ffh',
  "<cmd> lua require('telescope.builtin').find_files({ hidden = true, no_ignore=true, file_ignore_patterns = { '.git/' }})<CR>",
  { desc = 'Telescope find files' }
)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set(
  'n',
  '<leader>fgh',
  "<cmd> lua require('telescope.builtin').live_grep({ hidden = true, no_ignore=true, file_ignore_patterns = { '.git/' }})<CR>",
  { desc = 'Telescope live grep' }
)

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope grep string(word)' })
vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = 'Telescope list normal mode keymappings' })
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
