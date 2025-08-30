if status is-interactive
    fastfetch
end

set -gx EDITOR nvim
set -gx VISUAL nvim

# ALIASES

alias g git
alias l "lsd -la"
alias ls lsd
alias c clear
alias q exit
alias ga "git add ."
alias gcm "git commit -m"
alias code vscodium
alias s "shutdown -h now"
alias r reboot
alias bt-hyprx "bluetoothctl connect 00:42:79:67:FA:CF"
alias bt-d-hyprx "bluetoothctl disconnect 00:42:79:67:FA:CF"
alias em 'emacsclient -c -a ""' # GUI-фрейм (запустит демон, если не работает)
alias emt 'emacsclient -nw -a ""' # TUI-версия (в терминале)
alias kill-emacs 'emacsclient -e "(kill-emacs)"'
alias e "emacsclient -c"
alias rebuild "rm -rf build && mkdir build && cd build && cmake .. && cmake --build ."


    starship init fish | source
