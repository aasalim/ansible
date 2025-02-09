return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', "yavorski/lualine-macro-recording.nvim"  },
  config = function()
        require("custom.statusline")
  end
}

