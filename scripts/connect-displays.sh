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
	echo "connecting both displays"
	xrandr --output DP-1 --above eDP-1 --preferred  --scale 1  
	xrandr --output DP-2 --left-of  DP-1 --preferred  --scale 1
elif $DPI1_connected; then
	echo "connecting DPI-1"
	xrandr --output "DP-1" --above "eDP-1" --preferred  --scale 1 
elif $DPI2_connected; then
	echo "connecting DPI-2"
	xrandr --output "DP-2" --above "eDP-1" --preferred  --scale 1
fi

if $reaply_wallpaper; then
	wal -i ~/Pictures/Wal/$wallpaper
fi

echo -e "Configuration completed" 
