#!/bin/bash

brightness=$(( $(cat /sys/class/backlight/*/brightness) * 100 ))
max_brightness=$(cat /sys/class/backlight/*/max_brightness)
percentage=$(( brightness / max_brightness ))

dunstify -h int:value:"$percentage"  -i ~/.config/dunst/assets/brightness.svg -t 500 -r 2593 "Brightness: $percentage%"
