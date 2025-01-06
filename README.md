# Disable_middle_click_paste_linux
Disables in linux the paste functionality from the middle click 

Instructions:

1) Install xsel, wl-clipboard, jq and hyprland. For example:  sudo pacman -S xorg-xinput
2) Move the file disable_middle_mouse_paste.sh to the .config folder
3) Make the file executable: chmod +x ~/.config/disable_middle_mouse_paste
4) Put that file in the autostart (in settings most likely)

Source and thanks to Cestarian: https://unix.stackexchange.com/questions/24330/how-can-i-turn-off-middle-mouse-button-paste-functionality-in-all-programs
