
--  ____ _ _   
-- / ___(_) |_ 
--| |  _| | __|
--| |_| | | |_ 
-- \____|_|\__|

return 
  {
    {
      enabled = true,
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      }
    },
    {
      enabled = true,
      "lewis6991/gitsigns.nvim",
      config = function()
        require("custom.git")
      end
    }
  }
