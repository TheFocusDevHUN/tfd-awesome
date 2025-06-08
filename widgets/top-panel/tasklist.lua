local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

-- Create a tasklist widget
-- This works, however it may be better to inherit the s variable from the top panel itself
awful.screen.connect_for_each_screen(function(s)
	s.tasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		layout = wibox.layout.fixed.horizontal(),
		widget_template = {
			{
				{
					{
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
							resize = true,
						},
						margins = 4,
						widget = wibox.container.margin,
					},
					{
						id = "custom_text",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
					spacing = 4,
				},
				id = "background_role",
				widget = wibox.container.background,
			},
			widget = wibox.container.margin,
			margins = 2,

			-- Custom callbacks to use c.class instead of c.name
			create_callback = function(self, c, index, objects)
				local textbox = self:get_children_by_id("custom_text")[1]
				textbox.text = c.name or c.class or "?"
			end,
			update_callback = function(self, c, index, objects)
				local textbox = self:get_children_by_id("custom_text")[1]
				textbox.text = c.name or c.class or "?"
			end,
		},
	})
end)
