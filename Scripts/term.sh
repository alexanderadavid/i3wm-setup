#!/bin/sh

hidpi_display="eDP1"
current_display=$(python -u ~/Scripts/get_display.py)

if [[
  ("$current_display" == "DP2") ||
  ("$current_display" == "DP2-2") ||
  ("$current_display" == "DP1-2") ||
  ("$current_display" == "DP-1-2") ||
  ("$current_display" == "DP-1-1") ||
  ("$current_display" == "HDMI-1") 
  ]]; then 
  xdotool key ctrl+minus
fi

# if [[("$current_display" == "eDP-1")]]; then 
#   xdotool key ctrl+minus
# fi
