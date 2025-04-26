-- Pull in the wezterm API
local wezterm_drop = require("wezterm")
-- local mux = wezterm.mux
local config_drop = wezterm_drop.config_builder()

wezterm_drop.on("format-window-title", function()
	local title = "wezterm-drop"
	-- some logic here
	return title
end)

config_drop.enable_wayland = false
config_drop.color_scheme = "Dracula"

config_drop.show_tabs_in_tab_bar = false
config_drop.show_new_tab_button_in_tab_bar = false
config_drop.hide_tab_bar_if_only_one_tab = true
config_drop.enable_tab_bar = false

config_drop.font = wezterm_drop.font({
	family = "FiraCode Nerd Font",
})

config_drop.font_size = 18

config_drop.default_prog = { "/usr/bin/nu" }

return config_drop
