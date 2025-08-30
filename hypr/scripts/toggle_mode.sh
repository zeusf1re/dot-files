#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"
CURRENT_MODE=$(grep -oP '^\$current_mode = "\K[^"]+' "$CONFIG_FILE" || echo "default")

if [ "$CURRENT_MODE" = "default" ]; then
    # Переключаемся в минималистичный режим
    sed -i 's/$default_gaps/$minimal_gaps/g' "$CONFIG_FILE"
    sed -i 's/$default_rounding/$minimal_rounding/g' "$CONFIG_FILE"
    sed -i 's/$default_border_size/$minimal_border_size/g' "$CONFIG_FILE"
    killall waybar
    echo 'Минималистичный режим активирован!'
    notify-send "Hyprland Mode" "Минималистичный режим (без gaps, без waybar)"
else
    # Возвращаемся в обычный режим
    sed -i 's/$minimal_gaps/$default_gaps/g' "$CONFIG_FILE"
    sed -i 's/$minimal_rounding/$default_rounding/g' "$CONFIG_FILE"
    sed -i 's/$minimal_border_size/$default_border_size/g' "$CONFIG_FILE"
    waybar &
    echo 'Обычный режим активирован!'
    notify-send "Hyprland Mode" "Обычный режим (gaps, waybar)"
fi

# Перезагружаем Hyprland для применения изменений
hyprctl reload
