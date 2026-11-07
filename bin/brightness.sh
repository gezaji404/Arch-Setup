#!/usr/bin/env bash
case "$1" in
    up)   brightnessctl -q set 1%+ ;;
    down) brightnessctl -q -n1 set 1%- ;;
    *)    exit 1 ;;
esac

pct=$(brightnessctl -m | cut -d, -f4 | tr -d '%')

notify-send -t 1000 \
    -h string:x-dunst-stack-tag:brightness \
    -h int:value:"$pct" \
    "Brightness ${pct}%"
