#!/bin/bash
FOCUSED="$AEROSPACE_FOCUSED_WORKSPACE"
PREV="$AEROSPACE_PREV_WORKSPACE"

ARGS=(--set space.$FOCUSED background.drawing=on background.color=0xffd3d3d3 label.color=0xff000000)
if [ -n "$PREV" ] && [ "$PREV" != "$FOCUSED" ]; then
    ARGS+=(--set space.$PREV background.drawing=off label.color=0xffffffff)
fi

sketchybar "${ARGS[@]}"
