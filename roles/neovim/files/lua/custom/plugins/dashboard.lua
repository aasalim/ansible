return 
  {
    enabled = true,
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },

    config = function()
      require("custom.dashboard")
    end
  }
