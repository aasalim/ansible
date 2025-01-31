
-- Map <Leader>diary to call WikiDiaryTemplate
vim.api.nvim_set_keymap('n', '<Leader>diary', ':lua WikiDiaryTemplate()<CR>', { noremap = true, silent = true })

-- Function to insert a diary template
function WikiDiaryTemplate()
  local template = {
    '# ' .. os.date("%Y-%m-%d"),
    '',
    '## TODO',
    '* [ ] ',
    '',
    '## NOTES',
    '- ',
  }
  -- Replace the current line with the template
  vim.api.nvim_buf_set_lines(0, vim.fn.line('.') - 1, vim.fn.line('.'), false, template)
end
