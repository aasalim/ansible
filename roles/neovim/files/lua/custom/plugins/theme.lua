return {
  enabled = true,
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("custom.theme")
  end
}
