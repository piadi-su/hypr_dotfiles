#!/bin/bash

# --- Avvia Pipewire ---
systemctl --user enable --now pipewire pipewire-pulse pipewire-media-session

# --- Avvia XDG Desktop Portal per WLR ---
/usr/lib/xdg-desktop-portal-wlr &

# --- Avvia Gnome Keyring (opzionale, per Brave e gestione password) ---
/usr/bin/gnome-keyring-daemon --start --components=secrets &
