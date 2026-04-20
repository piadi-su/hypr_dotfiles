#!/bin/bash
#
# status=$(playerctl status 2>/dev/null)
#
# if [ "$status" = "Playing" ]; then
#     icon=""   # pause icon
# else
#     icon=""   # play icon
# fi
#
# artist=$(playerctl metadata artist 2>/dev/null)
# title=$(playerctl metadata title 2>/dev/null)
#
# if [ -z "$artist" ] && [ -z "$title" ]; then
#     echo "$icon  Nothing playing"
# else
#     echo "$icon  ${artist:0:15} - ${title:0:20}"
# fi

case "$1" in
    play-pause)
        playerctl play-pause
        exit 0
        ;;
    next)
        playerctl next
        exit 0
        ;;
    prev)
        playerctl previous
        exit 0
        ;;
esac

status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    icon=""
else
    icon=""
fi

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ -z "$artist" ] && [ -z "$title" ]; then
    echo "$icon  Nothing playing"
else
    echo "$icon  ${artist:0:15} - ${title:0:20}"
fi
