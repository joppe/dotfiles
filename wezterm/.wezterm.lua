-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This key binding interferes with neovim copilot
config.keys = {
	{
		mods = "ALT",
		key = "Enter",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.color_scheme = "catppuccin-mocha"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0
config.window_background_opacity = 0.9
config.text_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
