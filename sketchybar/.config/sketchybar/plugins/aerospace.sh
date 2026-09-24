#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on background.color=0xffd3d3d3 label.color=0xff000000
else
    sketchybar --set "$NAME" background.drawing=off label.color=0xffffffff
fi
