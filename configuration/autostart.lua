local apps = require("configuration.apps")
local filesystem = require("gears.filesystem")

-- List of apps to start once on start-up
return {
	run_on_start_up = {
		"picom --config " .. filesystem.get_configuration_dir() .. "configuration/picom.conf",
    "flameshot",
		"nm-applet --indicator", -- Network status
		--'blueberry-tray', -- Bluetooth tray icon
		"xfce4-power-manager", -- Power manager
		"numlockx on", -- enable numlock
		-- '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager (alternate directory if the first one is incorrect)
		"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)", -- credential manager
		-- 'blueman-tray', -- bluetooth tray
    "flatpak run com.bitwarden.desktop",
		-- Add applications that need to be killed between reloads
		-- to avoid multipled instances, inside the awspawn script
		"~/.config/awesome/configuration/autostartonce.sh", -- Spawn "dirty" apps that can linger between sessions
	},
}
