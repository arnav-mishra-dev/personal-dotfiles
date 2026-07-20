#!/bin/bash

SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Reboot\n5 - Shutdown" | fuzzel --dmenu --hide-prompt -l 5)"

EXIT_STATUS=$?
case $EXIT_STATUS in
	10) hyprlock; exit 0;;
	11) systemctl suspend; exit 0 ;;
	12) hyprshutdown; exit 0 ;;
	13) hyprshutdown -t 'Rebooting...' --post-cmd 'reboot'; exit 0 ;;
	14) hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'; exit 0 ;;	
esac

if [$EXIT_STATUS -eq -0]; then
	case "$SELECTION" in
		"1 - Lock") hyprlock ;;
	        "2 - Suspend") systemctl suspend ;;
	        "3 - Log out") hyprshutdown ;;
	        "4 - Reboot") hyprshutdown -t 'Rebooting...' --post-cmd 'reboot' ;;
	        "5 - Shutdown") hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0' ;;
	)
fi
