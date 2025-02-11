return {
  {
    enabled = true,
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      "nvim-tree/nvim-web-devicons",
    },
    "roodolv/markdown-toggle.nvim",
    config = function()
      require("custom.markdown")
    end
  }
}
