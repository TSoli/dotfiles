#!/bin/bash
VISIBLE=$(hyprspace list-workspaces --monitor all --visible | tr '\n' ',')
/opt/homebrew/bin/sketchybar --trigger hyprspace_workspace_change \
    FOCUSED_WORKSPACE="$AEROSPACE_FOCUSED_WORKSPACE" \
    PREV_WORKSPACE="$AEROSPACE_PREV_WORKSPACE" \
    VISIBLE_WORKSPACES="$VISIBLE"
