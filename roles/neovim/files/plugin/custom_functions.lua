--  ____          _                  
-- / ___|   _ ___| |_ ___  _ __ ___  
--| |  | | | / __| __/ _ \| '_ ` _ \ 
--| |__| |_| \__ \ || (_) | | | | | |
-- \____\__,_|___/\__\___/|_| |_| |_|
--                                   
-- _____                 _   _                 
--|  ___|   _ _ __   ___| |_(_) ___  _ __  ___ 
--| |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
--|  _|| |_| | | | | (__| |_| | (_) | | | \__ \
--|_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
--                                             
-- Insert C Guard
vim.keymap.set('n', '<Leader>~', function()
    local filename = vim.fn.expand('%:t')             -- Get filename with extension
    local guard = filename:gsub('%.', '_'):upper()    -- Process into guard macro


    -- Insert lines at appropriate positions
    vim.fn.append(0, {'#ifndef ' .. guard})
    vim.fn.append(1, {'#define ' .. guard})

    vim.fn.append('$', {'#endif /* ' .. guard .. ' */'})
end, { noremap = true })


