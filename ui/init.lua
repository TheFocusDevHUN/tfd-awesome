local awful = require("awful")
local top_panel = require("ui.top-panel")

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
	s.top_panel = top_panel(s)
end)

screen.connect_signal("property::geometry", function(s)
	if s.top_panel then
		s.top_panel.visible = false
		s.top_panel = nil
	end

	s.top_panel = top_panel(s)
end)

-- Hide bars when app go fullscreen
local function toggle_bars_visibility()
	for s in screen do
		if s.selected_tag then
			local fullscreen = s.selected_tag.fullscreenMode

			-- Make sure a panel does exist on this specific screen, otherwise return
			if s.top_panel == nil then
				return
			end
			s.top_panel.visible = not fullscreen
		end
	end
end

_G.tag.connect_signal("property::selected", function(t)
	toggle_bars_visibility()
end)

_G.client.connect_signal("property::fullscreen", function(c)
	c.screen.selected_tag.fullscreenMode = c.fullscreen
	toggle_bars_visibility()
end)

_G.client.connect_signal("unmanage", function(c)
	if c.fullscreen then
		c.screen.selected_tag.fullscreenMode = false
		toggle_bars_visibility()
	end
end)
