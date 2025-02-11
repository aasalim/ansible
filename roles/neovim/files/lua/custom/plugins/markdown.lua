return {
  {
    enabled = true,
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      "roodolv/markdown-toggle.nvim",
      'nvim-treesitter/nvim-treesitter',
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("custom.markdown")
    end
  }
}
