#!/bin/bash

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    icon=""   # pause icon
else
    icon=""   # play icon
fi

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ -z "$artist" ] && [ -z "$title" ]; then
    echo "$icon  Nothing playing"
else
    echo "$icon  ${artist:0:15} - ${title:0:20}"
fi
