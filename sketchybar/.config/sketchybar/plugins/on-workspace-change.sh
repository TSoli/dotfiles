#!/bin/bash
FOCUSED="$AEROSPACE_FOCUSED_WORKSPACE"
PREV="$AEROSPACE_PREV_WORKSPACE"

CMD=()
NEW_IDS=()

for sid in "$FOCUSED" "$PREV"; do
    [ -z "$sid" ] && continue
    if ! sketchybar --query "space.$sid" &>/dev/null; then
        NEW_IDS+=("$sid")
        CMD+=(--add item "space.$sid" left
              --add event "hyprspace_workspace_change_$sid"
              --set "space.$sid" \
                  background.color=0x44ffffff \
                  background.corner_radius=5 \
                  background.height=20 \
                  background.drawing=off \
                  label="$sid" \
                  click_script="hyprspace workspace $sid")
    fi
done

if [ "${#NEW_IDS[@]}" -gt 0 ]; then
    ALL_IDS=$( {
        sketchybar --query bar | jq -r '.items[]' \
            | grep -E '^space\.[0-9]+$' | sed 's/^space\.//'
        printf '%s\n' "${NEW_IDS[@]}"
    } | sort -nu )
    ORDER=()
    while IFS= read -r id; do ORDER+=("space.$id"); done <<< "$ALL_IDS"
    CMD+=(--reorder "${ORDER[@]}" chevron front_app)
fi

CMD+=(--set space.$FOCUSED \
        drawing=on \
        background.drawing=on \
        background.color=0xffd3d3d3 \
        label.color=0xff000000)

if [ -n "$PREV" ] && [ "$PREV" != "$FOCUSED" ]; then
    CMD+=(--set space.$PREV \
            background.drawing=off \
            label.color=0xffffffff)
fi

sketchybar "${CMD[@]}"

# Backgrounded empty-check, guarded against races with later switches
if [ -n "$PREV" ] && [ "$PREV" != "$FOCUSED" ]; then
    (
        # Re-check truth at write-time, not spawn-time: if PREV has since
        # become focused again (e.g. rapid A -> B -> A), bail — don't
        # clobber a highlight a newer invocation already set
        CURRENT_FOCUS=$(hyprspace list-workspaces --focused 2>/dev/null | tr -d ' \n')
        [ "$CURRENT_FOCUS" = "$PREV" ] && exit 0

        count=$(hyprspace list-windows --workspace "$PREV" 2>/dev/null | wc -l | tr -d ' ')
        [ "$count" -eq 0 ] && sketchybar --set space.$PREV drawing=off
    ) &
fi
