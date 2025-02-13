vim.keymap.set('n', '<Leader>fig', function()
  -- Get user input with prompts
  local user_input = vim.fn.input('Text: ')
  local first_char = vim.fn.input('First Character: ')

  -- Build the command string with proper escaping
  local cmd = string.format(
    "read !figlet '%s' | awk '{print \"%s\" $0}'",
    user_input:gsub("'", "'\\''"), -- Escape single quotes in input
    first_char:gsub('"', '\\"') -- Escape double quotes in first char
  )

  -- Execute the Vim command
  vim.cmd(cmd)
end, { noremap = true })
