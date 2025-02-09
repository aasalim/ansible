return {
  enabled = true,
  'nvim-lualine/lualine.nvim',
  dependencies = {"yavorski/lualine-macro-recording.nvim"},
  config = function()
    require("custom.statusline")
  end
}

