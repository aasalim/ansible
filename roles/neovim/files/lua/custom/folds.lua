local builtin = require('statuscol.builtin')
require('statuscol').setup({
  setopt = true, -- Whether to set the 'statuscolumn' option, may be set to false for those who
  -- want to use the click handlers in their own 'statuscolumn': _G.Sc[SFL]a().
  -- Although I recommend just using the segments field below to build your
  -- statuscolumn to benefit from the performance optimizations in this plugin.
  -- builtin.lnumfunc number string options
  thousands = false, -- or line number thousands separator string ("." / ",")
  relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
  -- Builtin 'statuscolumn' options
  ft_ignore = nil, -- Lua table with 'filetype' values for which 'statuscolumn' will be unset
  bt_ignore = nil, -- Lua table with 'buftype' values for which 'statuscolumn' will be unset
  -- Default segments (fold -> sign -> line number + separator), explained below
  segments = {
    { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
    { text = { '%s' }, click = 'v:lua.ScSa' },
    {
      text = { builtin.lnumfunc, ' ' },
      condition = { true, builtin.not_empty },
      click = 'v:lua.ScLa',
    },
  },
  clickmod = 'c', -- modifier used for certain actions in the builtin clickhandlers:
  -- "a" for Alt, "c" for Ctrl and "m" for Meta.
  clickhandlers = { -- builtin click handlers, keys are pattern matched
    Lnum = builtin.lnum_click,
    FoldClose = builtin.foldclose_click,
    FoldOpen = builtin.foldopen_click,
    FoldOther = builtin.foldother_click,
    DapBreakpointRejected = builtin.toggle_breakpoint,
    DapBreakpoint = builtin.toggle_breakpoint,
    DapBreakpointCondition = builtin.toggle_breakpoint,
    ['diagnostic/signs'] = builtin.diagnostic_click,
    gitsigns = builtin.gitsigns_click,
  },
})
local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

local hooks = require 'ibl.hooks'
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)

require('ibl').setup { indent = { highlight = highlight } }

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  pattern = { '*.*' },
  desc = 'save view (folds), when closing file',
  command = 'mkview',
})
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = { '*.*' },
  desc = 'load view (folds), when opening file',
  command = 'silent! loadview',
})
