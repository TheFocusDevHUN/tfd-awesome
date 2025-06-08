local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")

local configuration = require("configuration.config")
require("widgets.top-panel")

local function get_primary_screen()
	for s in screen do
		if s.primary then
			return s
		end
	end
	-- fallback to screen 1 if no primary flagged
	return screen[1]
end

local primary = get_primary_screen()

local TopPanel = function(s)
	if configuration.top_panel.only_on_primary and s ~= primary then
		return
	end
	local panel = wibox({
		ontop = true,
		visible = true,
		screen = s,
		height = configuration.top_panel.height,
		width = s.geometry.width,
		x = s.geometry.x,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
		struts = {
			top = configuration.top_panel.height,
		},
	})

	panel:struts({
		top = configuration.top_panel.height,
	})
	--

	panel:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.taglist,
		},
		s.tasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			s.layoutbox,
			Clock,
		},
	})

	return panel
end

return TopPanel
