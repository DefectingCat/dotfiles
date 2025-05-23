local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.font = wezterm.font("JetBrains Mono NL")
config.font = wezterm.font_with_fallback({ "Maple Mono Normal NF CN", "PingFang SC" })

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
config.window_background_opacity = 1
config.macos_window_background_blur = 37
config.initial_rows = 33
config.initial_cols = 120

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.colors = {
    tab_bar = {
        background = "rgba(0,0,0,0)",
    },
}

-- config.hide_tab_bar_if_only_one_tab = true
-- config.color_scheme = "Catppuccin Mocha"
config.font_size = 16

config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = wezterm.action.Nop,
    },
}

-- keys
local act = wezterm.action
config.keys = {
    { key = "l", mods = "ALT", action = act.ShowLauncher },
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = act.ActivatePaneDirection("Left"),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = act.ActivatePaneDirection("Right"),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = act.ActivatePaneDirection("Up"),
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = act.ActivatePaneDirection("Down"),
    },
}

return config
