-- Pull in the wezterm API
local wezterm = require("wezterm")
-- local mux = wezterm.mux
local config = wezterm.config_builder()

config.enable_wayland = false
-- config.color_scheme_dirs = {  }
config.color_scheme = "Dracula"

config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false

config.font = wezterm.font({
	family = "FiraCode Nerd Font",
})
-- config.font = wezterm.font 'Fira Code'

config.font_size = 18

-- config.default_prog = { "/usr/bin/nu", "-l" }

return config
