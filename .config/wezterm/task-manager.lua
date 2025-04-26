-- Pull in the wezterm API
local wezterm_task = require("wezterm")
-- local mux = wezterm.mux
local config_task = wezterm_task.config_builder()

wezterm_task.on("format-window-title", function()
	local title = "wezterm-task"
	-- some logic here
	return title
end)

config_task.enable_wayland = false
-- config_task.color_scheme_dirs = {  }
config_task.color_scheme = "Dracula"

config_task.show_tabs_in_tab_bar = false
config_task.show_new_tab_button_in_tab_bar = false
config_task.hide_tab_bar_if_only_one_tab = true
config_task.enable_tab_bar = false

config_task.font = wezterm_task.font({
	family = "FiraCode Nerd Font",
})
-- config_task.font = wezterm.font 'Fira Code'

config_task.font_size = 18

config_task.default_prog = { "btop" }

return config_task
