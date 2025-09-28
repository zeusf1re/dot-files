#!/bin/bash
# Рассчитываем ширину бара, чтобы влезло 10 штук
TERM_WIDTH=$(tput cols)
BAR_WIDTH=$(((TERM_WIDTH - 9) / 10)) # 9 = пробелы и отступы

cava -p <(echo "
[general]
bars = 10
[output]
bar_width = $BAR_WIDTH
bar_spacing = 1
gradient = 1
gradient_color_1 = '#f5e0dc'
gradient_color_2 = '#cba6f7'
")
