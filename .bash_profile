#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 &>/dev/null
# [[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx

# [ "$(tty)" = "/dev/tty1" ] && dbus-run-session Hyprland
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec sway
	# dbus-run-session sway
fi
