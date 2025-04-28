require('recall').setup({
  sign = '',
  sign_highlight = '@comment.note',

  telescope = {
    autoload = true,
    mappings = {
      unmark_selected_entry = {
        normal = 'dd',
        insert = '<C-d>',
      },
    },
  },

  wshada = vim.fn.has('nvim-0.10') == 0,
  telescope = {
    autoload = false,
  },
})

require('telescope').load_extension('recall')

-- Using commands:
vim.keymap.set('n', 'mm', ':RecallToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'mn', ':RecallNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'mp', ':RecallPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'mc', ':RecallClear<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ml', ':Telescope recall<CR>', { noremap = true, silent = true })

