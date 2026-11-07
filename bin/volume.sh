#!/usr/bin/env bash
case "$1" in
    up)      pactl set-sink-volume @DEFAULT_SINK@ +2% ;;
    down)    pactl set-sink-volume @DEFAULT_SINK@ -2% ;;
    mute)    pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    micmute) pactl set-source-mute @DEFAULT_SOURCE@ toggle ;;
    *)       exit 1 ;;
esac

if [ "$1" = micmute ]; then
    if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q yes; then
        msg="Mic off"
    else
        msg="Mic on"
    fi
    notify-send -t 1000 -h string:x-dunst-stack-tag:mic "$msg"
    exit 0
fi

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -n1)

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes; then
    notify-send -t 1000 -h string:x-dunst-stack-tag:volume "Volume muted"
else
    notify-send -t 1000 \
        -h string:x-dunst-stack-tag:volume \
        -h int:value:"$vol" \
        "Volume ${vol}%"
fi
