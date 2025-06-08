#!/bin/bash
## This configuration file is meant for applications that
#  still run in the background when a reload is triggered
#  for awesome, this script just kills the running instance
#  and starts a new one.
#  Only add applications/scripts without parameters here
#  (if you want to apply parameters then use a script file!)

# List of applications to run
# the script $HOME/.config/awesomestart
# is intended to be a copy of this file
# to allow out of tree autostart programs
APPS=(
    # $HOME/.config/awesomestart
    udiskie
)

# Some applications start child applications that need to be killed on reload
KILL=(
    # synergyc
    # nextcloud
)

# Flatpak applications to kill cleanly on reload
FLATPAKS=(
    com.discordapp.Discord
    # Add more Flatpak app IDs here if needed
)

# First kill lingering apps
for app in "${APPS[@]}"
do
    kill -9 $(pidof $app 2>/dev/null)
done

for app in "${KILL[@]}"
do
    kill -9 $(pidof $app 2>/dev/null)
done

# Kill Flatpak apps gracefully
for app in "${FLATPAKS[@]}"
do
    flatpak kill "$app" 2>/dev/null
done

# Start new instances
for app in "${APPS[@]}"
do
    env $app ${@:2} &
done
