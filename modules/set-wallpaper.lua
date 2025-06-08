local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Preload and cache wallpaper surface
local wallpaper_surface = nil

local function set_wallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end

		-- Cache the surface only once
		if not wallpaper_surface then
			wallpaper_surface = gears.surface.load_uncached(wallpaper)
		end

		-- Apply preloaded surface to the screen
		gears.wallpaper.set(wallpaper_surface, s)
	end
end

screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)
end)
