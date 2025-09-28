#!/bin/bash


WALLPAPER_DIR="$HOME/images/wallpapers"
CURRENT_WALLPAPER_FILE="$HOME/.config/hypr/current_wallpaper.txt"

# Получаем список всех изображений в папке
wallpapers=("$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp} 2>/dev/null)

# Если папка пустая или не существует
if [ ${#wallpapers[@]} -eq 0 ] || [ ! -d "$WALLPAPER_DIR" ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Читаем текущие обои или устанавливаем первые
if [ -f "$CURRENT_WALLPAPER_FILE" ]; then
    current_wallpaper=$(cat "$CURRENT_WALLPAPER_FILE")
else
    current_wallpaper="${wallpapers[0]}"
    echo "$current_wallpaper" > "$CURRENT_WALLPAPER_FILE"
fi

# Находим индекс текущих обоев
current_index=0
for i in "${!wallpapers[@]}"; do
    if [ "${wallpapers[i]}" = "$current_wallpaper" ]; then
        current_index=$i
        break
    fi
done

# Вычисляем следующие обои (циклически)
next_index=$(( (current_index + 1) % ${#wallpapers[@]} ))
next_wallpaper="${wallpapers[next_index]}"

# Сохраняем следующие обои
echo "$next_wallpaper" > "$CURRENT_WALLPAPER_FILE"

# Меняем обои через hyprpaper
hyprctl hyprpaper preload "$next_wallpaper"
hyprctl hyprpaper wallpaper "eDP-1,$next_wallpaper"
hyprctl hyprpaper wallpaper "HDMI-A-1,$next_wallpaper"  # если есть второй монитор
hyprctl hyprpaper wallpaper "DP-1,$next_wallpaper"      # если есть DisplayPort

# Уведомление (опционально)
notify-send "Wallpaper Changed" "$(basename "$next_wallpaper")" -t 2000
