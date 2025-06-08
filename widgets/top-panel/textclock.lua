local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
-- Create a textclock widget
Clock = wibox.widget.textclock()
Clock.font = beautiful.clock_font

local month_calendar = awful.widget.calendar_popup.month({
	screen = s,
	start_sunday = false,
	week_numbers = false,
})

month_calendar:attach(Clock)

return Clock
