#!/usr/bin/env bash
dir=$HOME/.wallpapers
args=()

for mon in $(xrandr --listmonitors | awk 'NR>1 {print $NF}'); do
    case "$mon" in
        HDMI-1) img="$dir/gritty.png" ;;
        *)      img="$dir/simple.png" ;;
    esac
    args+=(--bg-fill "$img")
done

feh "${args[@]}"
