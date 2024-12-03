local wezterm = require("wezterm")
local theme = require("wezterm-dragon")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 20

config.colors = theme

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.window_close_confirmation = "NeverPrompt"

config.send_composed_key_when_left_alt_is_pressed = true
config.enable_kitty_graphics = true

return config
