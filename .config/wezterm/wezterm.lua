-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 18
config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 70

config.text_background_opacity = 0.9
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 5,
}

return config
