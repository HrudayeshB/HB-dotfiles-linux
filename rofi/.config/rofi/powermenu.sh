#!/bin/sh

CHOSEN=$(printf " Lock\n⏾ Suspend\n Reboot\n Shutdown\n Log Out" | rofi -dmenu -i -p "Power Menu" -theme powermenu.rasi)

case "$CHOSEN" in
  *Lock*) hyprlock ;;  # or gtklock, etc.
  *Suspend*) systemctl suspend-then-hibernate ;;
  *Reboot*) reboot ;;
  *Shutdown*) poweroff ;;
  *Log\ Out*) hyprctl dispatch exit ;;
  *) exit 1 ;;
esac
