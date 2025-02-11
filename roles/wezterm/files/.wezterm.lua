-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font 'JetBrainsMono NF'

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Moon'

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
    {
      key = 'F11',
      action = wezterm.action.ToggleFullScreen,
    },
  }
-- and finally, return the configuration to wezterm
return config
