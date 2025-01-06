#!/bin/bash
# Script to disable middle mouse paste for both Wayland and X11 environments
# Dependencies: xsel, wl-clipboard, jq, hyprctl

# Define applications with known GTK selection issues
applist="gedit thunar mousepad gparted pcmanfm"

# Wayland-specific functionality
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false # Disable primary paste for GTK apps

    wl-paste -p --watch bash -c '
    active_window=$(hyprctl -j activewindow | jq .class)
    if ! echo $active_window | grep -Ei "$(echo "'"$applist"'" | sed "s: :|:g")" >/dev/null; then
        wl-copy -cp
    fi
    ' & # Run in the background
fi

# X11-specific functionality
if [ "$XDG_SESSION_TYPE" == "x11" ]; then
    while true; do
        xsel -fin </dev/null # Clear the clipboard continuously
    done
fi
