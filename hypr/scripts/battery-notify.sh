#!/bin/bash

# Порог для уведомления (10%)
THRESHOLD=10

while true; do
  # Получаем текущий заряд батареи
  BATTERY_STATUS=$(acpi -b)
  BATTERY_LEVEL=$(echo "$BATTERY_STATUS" | grep -P -o '[0-9]+(?=%)' | head -1)

  # Проверяем, что батарея разряжается и уровень ниже порога
  if [[ $BATTERY_STATUS == *"Discharging"* ]] && [[ $BATTERY_LEVEL -le $THRESHOLD ]]; then
    notify-send -u critical "🔋 Низкий заряд батареи!" "Осталось ${BATTERY_LEVEL}% — подключите зарядное устройство!"
  fi

  # Проверяем каждые 60 секунд
  sleep 60
done
