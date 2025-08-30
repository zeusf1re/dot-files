source ~/.cache/carapace/init.nu

fastfetch

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
alias g = git
alias c = clear
alias q = exit
alias ga = git add .
def gcm [message: string] {
    git commit -m $message
}
alias code = vscodium
alias s = shutdown -h now
alias r = reboot
alias bt-hyprx = bluetoothctl connect 00:42:79:67:FA:CF
alias bt-d-hyprx = bluetoothctl disconnect 00:42:79:67:FA:CF
alias em = emacsclient -c -a ""
alias emt = emacsclient -nw -a ""
alias kill-emacs = emacsclient -e "(kill-emacs)"
alias e = emacsclient -c
def rebuild [] {
    rm -rf build
    mkdir build
    cd build
    cmake ..
    cmake --build .
}
alias n = nu
alias config = nvim ~/.config/nushell/config.nu

$env.PAGER = "less"
$env.LESS = "-R"

# Пример: если у вас были кастомные функции в Fish
def --env mkcd [dir: string] {
    mkdir $dir
    cd $dir
}

def --env take [dir: string] {
    mkdir $dir
    cd $dir
}

$env.config.history = {
    max_size: 10000
    sync_on_enter: true
    file_format: "plaintext"
}

$env.config = {
        show_banner: false # Set to true or false to enable or disable the welcome banner
        }


# Color scheme Kanagawa Wave для Nushell
$env.config.color_config = {
    # Основные цвета
    separator: "#727169"
    leading_trailing_space_bg: "#2A2A37"
    header: "#98BB6C"
    empty: "#7E9CD8"
    bool: "#DCD7BA"
    int: "#E6C384"
    filesize: "#7AA89F"
    duration: "#7FB4CA"
    date: "#938AA9"
    range: "#C8C093"
    float: "#E6C384"
    string: "#DCD7BA"
    nothing: "#727169"
    binary: "#DCD7BA"
    cellpath: "#727169"
    row_index: "#98BB6C"
    record: "#C8C093"
    list: "#C8C093"
    block: "#C8C093"
    hints: "#54546D"

    # Цвета для конкретных типов
    shape_string: "#98BB6C"
    shape_string_interpolation: "#7AA89F"
    shape_command: "#7E9CD8"
    shape_keyword: "#957FB8"
    shape_operator: "#E6C384"
    shape_signature: "#7E9CD8"
    shape_internalcall: "#7AA89F"
    shape_external: "#6A9589"
    shape_externalarg: "#98BB6C"
    shape_literal: "#7E9CD8"
    shape_globpattern: "#7AA89F"
    shape_variable: "#938AA9"
    shape_flag: "#7E9CD8"
    shape_custom: "#98BB6C"
    shape_nothing: "#7AA89F"
    shape_bool: "#957FB8"
    shape_int: "#E6C384"
    shape_float: "#E6C384"
    shape_list: "#7AA89F"
    shape_table: "#7E9CD8"
    shape_record: "#7AA89F"
    shape_block: "#7E9CD8"
    shape_filepath: "#6A9589"
    shape_directory: "#6A9589"
    shape_range: "#E6C384"
    shape_binary: "#957FB8"
}
# Настройка highlight
$env.config.highlight_resolved_externals

# Настройка курсора
$env.config.cursor_shape = {
    emacs: line
    vi_insert: line
    vi_normal: block
}

# Включите подсказки
