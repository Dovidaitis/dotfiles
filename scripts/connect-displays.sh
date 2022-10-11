#! /bin/bash
DPI1_connected=false
DPI2_connected=false
reapply_wallpaper=true

wallpaper=bg2.png

echo -e "Configuring display settings"


if $(xrandr | grep -wq "DP-1 connected"); then
	DPI1_connected=true
fi

if $(xrandr | grep -wq "DP-2 connected"); then
	DPI2_connected=true
fi

if $($DPI1_connected && $DPI2_connected); then
	xrandr --output DP-1 --above eDP-1 --auto  --scale 0.75  
	xrandr --output DP-2 --left-of  DP-1 --auto  --scale 0.75
elif $DPI1_connected; then
	xrandr --output "DP-1" --above "eDP-1" --auto
elif $DPI2_connected; then
	xrandr --output "DP-2" --above "eDP-1" --auto 
fi

if $reaply_wallpaper; then
	wal -i ~/Pictures/Wal/$wallpaper
fi

echo -e "Configuration completed" 
