local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.line_height = 1.2

config.font_size = 14
config.font = wezterm.font("Hack Nerd Font")

config.tab_max_width = 40

config.colors = {
	cursor_bg = "white",
	cursor_border = "white",

	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#111",

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#111",
			-- The color of the text for the tab
			fg_color = "#fff",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Normal",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#222",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#000",
			fg_color = "#909090",
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#222",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#000",
			fg_color = "#909090",
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

-- config.enable_tab_bar = false
--config.window_decorations = "TITLE | RESIZE"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
--config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
--config.show_tab_index_in_tab_bar = false

config.window_background_image = "/home/jefersonrodrigoprudenciobelmiro/dotfiles/wallpaper/2.jpg"
config.window_background_image_hsb = {
	brightness = 0.04,

	hue = 1.0,

	-- You can adjust the saturation also.
	saturation = 0.0,
}

-- config.background = {
-- 	{
-- 		source = {
-- 			File = {
-- 				path = "/home/jefersonrodrigoprudenciobelmiro/Pictures/backgrounds/stars.gif",
-- 				speed = 0.02,
-- 			},
-- 			--File = "/home/jefersonrodrigoprudenciobelmiro/Pictures/backgrounds/4.jpeg",
-- 			--File = "/home/jefersonrodrigoprudenciobelmiro/Pictures/backgrounds/stars.gif",
-- 			--File = "/home/jefersonrodrigoprudenciobelmiro/dotfiles/wallpaper/1.jpg",
-- 		},
-- 	},
-- }

config.keys = {
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action_callback(function(window, pane)
			local tab = window:mux_window():active_tab()
			if tab:get_pane_direction("Left") ~= nil then
				window:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
			else
				window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
			end
		end),
	},
	--{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	--{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action_callback(function(window, pane)
			local tab = window:mux_window():active_tab()
			if tab:get_pane_direction("Right") ~= nil then
				window:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
			else
				window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
			end
		end),
	},

	{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
	{ key = "0", mods = "ALT", action = wezterm.action.ActivateTab(9) },

	{ key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
	{ key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
}

config.window_frame = {
	inactive_titlebar_bg = "#111",
	active_titlebar_bg = "#111",
	inactive_titlebar_fg = "#cccccc",
	active_titlebar_fg = "#ffffff",
	inactive_titlebar_border_bottom = "#000",
	active_titlebar_border_bottom = "#000",
	button_fg = "#cccccc",
	button_bg = "#111",
	button_hover_fg = "#ffffff",
	button_hover_bg = "#000",

	border_left_width = "2px",
	border_right_width = "2px",
	border_bottom_height = "2px",
	border_top_height = "2px",
	border_left_color = "#333",
	border_right_color = "#333",
	border_bottom_color = "#333",
	border_top_color = "#333",
}

config.window_padding = {
	right = 2,
	left = 2,
	top = 2,
	bottom = 2,
}

return config
