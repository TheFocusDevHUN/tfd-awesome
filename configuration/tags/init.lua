local awful = require("awful")
local gears = require("gears")
-- local icons = require('theme.icons')
local apps = require("configuration.apps")

-- Configure Tag Properties
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.max,
	awful.layout.suit.floating,
}

-- Then assign tags to screens using the first layout (tile)
awful.screen.connect_for_each_screen(function(s)
	awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])
end)
-- }}}
