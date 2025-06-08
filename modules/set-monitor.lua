local spawn = require("awful.spawn")

spawn.with_shell(
	"xrandr --output DP-2 --mode 2560x1080 --pos 0x1080 --primary --output HDMI-1 --mode 1920x1080 --pos 320x0"
)
