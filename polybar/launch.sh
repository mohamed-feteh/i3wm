#!/usr/bin/env bash

# remove all instances
killall -q polybar

# Enable bar for each monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload ibar &
  done
else
  polybar --reload ibar &
fi

echo "Bars launched..."
