return {
  'luukvbaal/statuscol.nvim',
  dependencies = { 'lukas-reineke/indent-blankline.nvim' },
  config = function()
    require('custom.folds')
  end,
}
