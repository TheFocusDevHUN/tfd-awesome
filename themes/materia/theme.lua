--------------------------------------------
-- Material design inspired awesome theme --
--------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local builtin_themes_path = gfs.get_themes_dir()
local theme_path = gfs.get_configuration_dir() .. "themes/materia/"

local theme = {}

theme.font = "Roboto 15"
theme.clock_font = "Roboto Normal 16, bold"
theme.taglist_font = "Roboto 15, Mono Semibold"

theme.bg_normal = "#000000"
theme.bg_focus = "#212121"
theme.bg_urgent = "#FFFF8D"
theme.bg_minimize = "#424242"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#F57F17"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(2)
theme.border_width = dpi(1)
theme.border_normal = "#444444"
theme.border_focus = "#2196F3"
theme.border_marked = "#ffffff"

theme.taglist_bg_focus = "#212121"
theme.taglist_fg_focus = "#FAFAFA"
theme.taglist_spacing = dpi(2)

theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil

theme.menu_submenu_icon = builtin_themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

--theme.notification_width = dpi(500)
--notification_margintheme.notification_height = dpi(100)
--theme.notification_max_width = theme.notification_width
--theme.notification_max_height = theme.notification_height
theme.notification_margin = dpi(15)

-- Define the image to load

theme.wallpaper = gfs.get_configuration_dir() .. "themes/materia/1.jpg"

-- You can use your own layout icons like this:
theme.layout_floating = theme_path .. "layouts/floating.png"
theme.layout_max = theme_path .. "layouts/max.png"
theme.layout_fullscreen = theme_path .. "layouts/fullscreen.png"
theme.layout_tile = theme_path .. "layouts/tile.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
