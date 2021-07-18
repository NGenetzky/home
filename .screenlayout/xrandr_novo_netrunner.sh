#!/bin/sh
xrandr --setprovideroutputsource 1 0
xrandr --setprovideroutputsource 2 0
xrandr --setprovideroutputsource 3 0
xrandr --setprovideroutputsource 4 0

xrandr --output DVI-I-4-4 --off --output DVI-I-3-3 --off --output DVI-I-2-2 \
--mode 3840x2160 --pos 3840x1080 --rotate normal --output eDP-1 --primary \
--mode 1920x1080 --pos 5760x0 --rotate normal --output DVI-I-1-1 --mode \
3840x2160 --pos 0x1080 --rotate normal \
#
