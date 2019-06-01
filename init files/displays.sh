#!/bin/sh
xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync 
xrandr --addmode VGA-0 "1920x1080_60.00" 
xrandr --auto
xrandr --output VGA-0 --primary
xrandr -s 1920x1080 
xrandr --output HDMI-0 --auto
xrandr --output HDMI-0 --right-of VGA-0
