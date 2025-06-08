local dpi = require("beautiful.xresources").apply_dpi
local menubar = require("menubar")

apps = {

	-- Your default terminal
	terminal = "wezterm",

	-- Your default text editor
	editor = os.getenv("EDITOR") or "nvim",
	screenshot = "flameshot",
	screenshot_area = "flameshot gui",

	-- Your default file explorer
	explorer = "thunar",
	rofi = "rofi -show drun",
}

apps.editor_cmd = apps.terminal .. " -e " .. apps.editor
apps.explorer_cmd = apps.terminal .. " -e " .. apps.explorer
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it

return apps
