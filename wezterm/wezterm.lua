local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.default_prog = { "C:\\Users\\xfy\\AppData\\Local\\Microsoft\\WindowsApps\\pwsh.exe" }

-- ui
config.initial_rows = 50
config.initial_cols = 198
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

return config
