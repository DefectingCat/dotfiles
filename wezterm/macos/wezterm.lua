local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")

-- ui
--[[ config.initial_rows = 50 ]]
--[[ config.initial_cols = 198 ]]
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- window
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.96
config.macos_window_background_blur = 10
config.initial_rows = 30
config.initial_cols = 90

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = {
    tab_bar = {
        background = "rgba(0,0,0,0)"
    },
}

config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Catppuccin Mocha"
config.font_size = 16


return config
